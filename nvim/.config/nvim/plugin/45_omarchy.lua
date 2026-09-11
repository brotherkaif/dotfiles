-- ┌──────────────────────┐
-- │ Omarchy theme hook   │
-- └──────────────────────┘
--
-- Brings Omarchy's theme changing into MiniMax.
--
-- Omarchy regenerates
--   ~/.local/state/omarchy/current/theme/neovim.lua
-- every time a theme is set. That file is a lazy.nvim plugin spec: some stock
-- themes ship their own `neovim.lua` (e.g. kanagawa -> kanagawa.nvim), the
-- rest are rendered from Omarchy's `neovim.lua.tpl` template onto
-- 'aether.nvim'. MiniMax has no lazy.nvim, so this file parses that spec and
-- applies the colorscheme it describes.
--
-- This file:
-- - installs the colorscheme plugins referenced by every stock Omarchy theme,
-- - parses the current `neovim.lua` spec and applies its colorscheme
--   (carrying the `colors` table through to aether when present),
-- - watches the Omarchy theme directory so a running Neovim follows theme
--   switches in place. MiniMax has no lazy.nvim, so there is no `LazyReload`
--   autocommand to lean on; a `vim.uv.fs_event` watcher is its replacement.
--
-- On macOS / non-Omarchy systems the theme file never exists: no theme
-- plugins are installed and MiniMax uses Neovim's default colorscheme.

-- The `current/` parent directory is watched rather than `theme/neovim.lua`
-- itself, because Omarchy swaps the whole `theme/` directory on a switch and
-- the file's inode changes with it.
local theme_file = vim.fn.expand('~/.local/state/omarchy/current/theme/neovim.lua')
local theme_dir = vim.fn.expand('~/.local/state/omarchy/current')

local function theme_present()
  return vim.fn.filereadable(theme_file) == 1
end

-- Colorscheme plugins referenced by every stock Omarchy theme (both the ones
-- that ship their own `neovim.lua` and the template-based ones). Only
-- installed when Omarchy is present, so macOS stays lean. `name` is set where
-- the repository name would otherwise be generic ('nvim', 'neovim').
local theme_plugins = {
  { src = 'https://github.com/ribru17/bamboo.nvim' },
  { src = 'https://github.com/bjarneo/aether.nvim', version = 'v3' },
  { src = 'https://github.com/bjarneo/ethereal.nvim' },
  { src = 'https://github.com/bjarneo/hackerman.nvim' },
  { src = 'https://github.com/bjarneo/vantablack.nvim' },
  { src = 'https://github.com/bjarneo/white.nvim' },
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  { src = 'https://github.com/neanias/everforest-nvim' },
  { src = 'https://github.com/kepano/flexoki-neovim' },
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
  { src = 'https://github.com/rebelot/kanagawa.nvim' },
  { src = 'https://github.com/tahayvr/matteblack.nvim' },
  { src = 'https://github.com/EdenEast/nightfox.nvim' },
  { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
  { src = 'https://github.com/ficcdaf/ashen.nvim' },
  { src = 'https://github.com/folke/tokyonight.nvim' },
  { src = 'https://github.com/OldJobobo/miasma.nvim' },
  { src = 'https://github.com/OldJobobo/retro-82.nvim' },
  { src = 'https://github.com/omacom-io/lumon.nvim' },
}

local function install_themes()
  -- aether is what template-rendered themes use; install it first so those
  -- themes apply even if a side theme fails to fetch. The rest are
  -- best-effort: one unavailable repo must not abort the theme hook.
  local ok, err = pcall(vim.pack.add, theme_plugins)
  if not ok then
    vim.notify('Omarchy: could not install some theme plugins: ' .. tostring(err), vim.log.levels.WARN)
  end
end

if theme_present() then
  install_themes()
end

-- Apply the colorscheme described by an Omarchy 'neovim.lua' spec.
-- Returns true on success (colorscheme name matched) so callers can fall back.
local function apply_spec(colorscheme, colors)
  -- Template-rendered themes (and the custom data-module format) carry the
  -- palette in `colors`; only aether knows how to consume it.
  if colors then
    local ok_aether, aether = pcall(require, 'aether')
    if not ok_aether then
      return false
    end
    aether.setup({ colors = colors })
    vim.cmd.colorscheme('aether')
    return vim.g.colors_name == 'aether'
  end

  pcall(vim.cmd.colorscheme, colorscheme)
  return vim.g.colors_name == colorscheme
end

-- Apply the current Omarchy theme. The generated 'neovim.lua' is a lazy.nvim
-- spec list; parse out the colorscheme name (from the 'LazyVim/LazyVim' entry,
-- falling back to the plugin name) and any palette carried in `opts.colors`.
-- Every failure path falls back to Neovim's default colorscheme.
local function apply_theme()
  local ok_data, data = pcall(dofile, theme_file)
  if not ok_data or type(data) ~= 'table' then
    return apply_spec('default', nil)
  end

  -- Custom data-module format: `return { colors = { ... } }`
  if type(data.colors) == 'table' then
    if apply_spec('aether', data.colors) then
      return
    end
    return apply_spec('default', nil)
  end

  local colorscheme, colors
  for _, entry in ipairs(data) do
    if type(entry) ~= 'table' then
      goto continue
    end

    local src = type(entry[1]) == 'string' and entry[1] or entry.src
    if src == 'LazyVim/LazyVim' then
      if type(entry.opts) == 'table' and type(entry.opts.colorscheme) == 'string' then
        colorscheme = entry.opts.colorscheme
      end
    elseif src then
      if colorscheme == nil then
        colorscheme = vim.fn.fnamemodify(src, ':t')
      end
      if type(entry.opts) == 'table' and type(entry.opts.colors) == 'table' then
        colors = entry.opts.colors
      end
    end
    ::continue::
  end

  if not colorscheme or not apply_spec(colorscheme, colors) then
    apply_spec('default', nil)
  end
end

apply_theme()

-- Hot reload ---------------------------------------------------------------
local uv = vim.uv or vim.loop
local last_mtime = nil

-- Holds the fs_event handle. `maybe_reload` (passed as the handle's callback)
-- closes over this table, so the running handle keeps itself referenced and
-- cannot be garbage collected (luv handles cannot be stored in `vim.g`).
local watcher_state = { handle = nil }

local function current_mtime()
  local stat = uv.fs_stat(theme_file)
  return stat and stat.mtime.sec or nil
end

local function maybe_reload()
  local mtime = current_mtime()
  if mtime and mtime ~= last_mtime then
    last_mtime = mtime
    -- fs_event callbacks run in a fast-event context where Vimscript calls
    -- (like aether's `vim.fn.expand`) are forbidden; apply outside of it
    vim.schedule(apply_theme)
  end
  return watcher_state.handle ~= nil
end

if theme_present() then
  last_mtime = current_mtime()

  -- Neovim >= 0.12 exposes the fs_event handle via `new_fs_event()` rather
  -- than the older `uv.fs_event()` wrapper.
  local ok_watch, watcher = pcall(uv.new_fs_event)
  if ok_watch and watcher then
    local ok_start, err = pcall(watcher.start, watcher, theme_dir, {}, maybe_reload)
    if not ok_start then
      vim.notify('Omarchy: could not watch theme directory: ' .. tostring(err), vim.log.levels.WARN)
    end
    watcher_state.handle = watcher
  end

  -- Cheap fallback for events the watcher may miss
  vim.api.nvim_create_autocmd('FocusGained', {
    callback = maybe_reload,
    desc = 'Reload Omarchy theme',
  })
end
