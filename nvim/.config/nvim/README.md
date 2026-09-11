# Neovim (MiniMax)

[MiniMax](https://github.com/nvim-mini/MiniMax) (nvim-0.12 reference config) -
a Neovim config based on [mini.nvim](https://github.com/nvim-mini/mini.nvim),
using the built-in `vim.pack` plugin manager.

This is a config **generator** output, not a distribution: after setup the
config is yours to edit. Upstream reference configs live at
`configs/nvim-0.12/` in the MiniMax repo.

## Structure

- `init.lua` - initial file executed during startup; sets up `vim.pack`
  loading helpers.
- `plugin/` - files sourced automatically at startup (alphabetical):
  - `10_options.lua` - built-in Neovim behavior
  - `20_keymaps.lua` - custom `<Leader>` mappings
  - `30_mini.lua` - mini.nvim module configuration
  - `40_plugins.lua` - plugins outside of mini.nvim (tree-sitter, LSP, ...)
  - `42_remote_clipboard.lua` - OSC52 clipboard for tmux/SSH/herdr sessions
  - `45_omarchy.lua` - Omarchy theme install/apply/hot-reload
  - `50_transparency.lua` - transparent highlight groups (Omarchy)
- `snippets/` - user snippets (`global.json` demo)
- `after/` - files overriding plugin behavior (ftplugin, LSP, snippets)

## Omarchy integration

On Omarchy, `omarchy theme set <name>` regenerates
`~/.local/state/omarchy/current/theme/neovim.lua`. That file is a lazy.nvim
plugin spec (stock themes ship their own; the rest are rendered by Omarchy's
`neovim.lua.tpl` template onto `aether.nvim`). MiniMax has no lazy.nvim, so
`plugin/45_omarchy.lua` parses that spec, applies the colorscheme it describes
(carrying the palette through to
[aether](https://github.com/bjarneo/aether.nvim) when present), and watches the
theme directory so a running Neovim follows theme switches in place.

On macOS (no Omarchy), the theme file never exists: no theme plugins are
installed and MiniMax uses Neovim's default colorscheme.

## Getting started

- Update plugins: `:lua vim.pack.update()` (then `:write` to confirm).
- Edit your config from inside Neovim: `<Space>ei` for `init.lua`,
  `<Space>ep` for `plugin/40_plugins.lua`, etc. (see `<Space>?` or the
  keymaps file).
