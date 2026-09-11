-- ┌──────────────┐
-- │ Transparency │
-- └──────────────┘
--
-- Make highlight groups transparent so Neovim shows Omarchy's blurred
-- terminal background behind it. It runs on every `ColorScheme` event, so it
-- also follows Omarchy theme hot-reloads (see 'plugin/45_omarchy.lua').
--
-- The group list tracks the modules MiniMax enables: 'mini.statusline',
-- 'mini.tabline', 'mini.files', 'mini.pick', 'mini.notify', 'mini.starter',
-- 'mini.map'. Add/remove groups as you enable or disable modules.

-- Make a highlight group transparent while preserving its other attributes
local function make_transparent(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok and hl then
    hl.bg = nil
    vim.api.nvim_set_hl(0, name, hl)
  end
end

local groups = {
  -- Core
  'Normal',
  'NormalFloat',
  'NormalNC',
  'FloatBorder',
  'FloatTitle',
  'Pmenu',
  'PmenuSel',
  'PmenuSbar',
  'PmenuThumb',
  'EndOfBuffer',
  'FoldColumn',
  'Folded',
  'SignColumn',
  'LineNr',
  'CursorLineNr',
  'Terminal',
  'MsgArea',
  'QuickFixLine',
  'Conceal',
  -- Statusline / tabline / winbar
  'StatusLine',
  'StatusLineNC',
  'StatusLineTerm',
  'StatusLineTermNC',
  'TabLine',
  'TabLineFill',
  'TabLineSel',
  'WinBar',
  'WinBarNC',
  -- mini.files
  'MiniFilesNormal',
  'MiniFilesBorder',
  'MiniFilesTitle',
  'MiniFilesTitleName',
  -- mini.notify
  'MiniNotifyNormal',
  'MiniNotifyBorder',
  'MiniNotifyTitle',
  'MiniNotifyINFOBody',
  'MiniNotifyERRORBody',
  'MiniNotifyWARNBody',
  'MiniNotifyTRACEBody',
  'MiniNotifyDEBUGBody',
  'MiniNotifyINFOTitle',
  'MiniNotifyERRORTitle',
  'MiniNotifyWARNTitle',
  'MiniNotifyTRACETitle',
  'MiniNotifyDEBUGTitle',
  'MiniNotifyINFOBorder',
  'MiniNotifyERRORBorder',
  'MiniNotifyWARNBorder',
  'MiniNotifyTRACEBorder',
  'MiniNotifyDEBUGBorder',
  -- mini.pick
  'MiniPickNormal',
  'MiniPickBorder',
  'MiniPickBorderText',
  'MiniPickPrompt',
  -- mini.starter
  'MiniStarterNormal',
  'MiniStarterBorder',
  'MiniStarterHeader',
  'MiniStarterFooter',
  'MiniStarterQuery',
  -- mini.map
  'MiniMapNormal',
  'MiniMapSymbolCount',
  'MiniMapSymbolLine',
  'MiniMapSymbolView',
}

local function apply_transparency()
  for _, name in ipairs(groups) do
    make_transparent(name)
  end
end

-- Apply once for the initial colorscheme, then on every switch (including
-- Omarchy theme hot-reloads)
apply_transparency()

local grp = vim.api.nvim_create_augroup('omarchy-transparency', {})
vim.api.nvim_create_autocmd('ColorScheme', {
  group = grp,
  callback = apply_transparency,
  desc = 'Make highlight groups transparent (Omarchy)',
})
