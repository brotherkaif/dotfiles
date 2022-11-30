lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = true
lvim.colorscheme = "tokyonight"

-- KEYMAPS
lvim.builtin.which_key.mappings["p"] = {
  ":Telescope<CR>", "Command Palette"
}

lvim.builtin.which_key.mappings[" "] = {
  name = "easymotion",
  s = {":HopChar<cr>", "Search character"},
  f = {":HopChar1AC<cr>", "Find character forwards"},
  F = {":HopChar1BC<cr>", "Find character backwards"},
  t = {":HopChar1AC<cr>", "Til character forwards"},
  T = {":HopChar1BC<cr>", "Til character backwards"},
  w = {":HopWordAC<cr>", "Start of word forwards"},
  b = {":HopWordBC<cr>", "Start of word backwards"},
  l = {":HopWordAC<cr>", "Matches beginning & ending of word forwards"},
  h = {":HopWordBC<cr>", "Matches beginning & ending of word backwards"},
  e = {":HopWordAC<cr>", "End of word forwards"},
  ge = {":HopWordBC<cr>", "End of word backwards"},
  j = {":HopLineStartAC<cr>", "Start of line forwards"},
  k = {":HopLineStartBC<cr>", "Start of line backwards"},
  ["/"] = {":HopPattern<cr>", "Search n-character"},
}

-- PLUGINS
lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
}

-- PACKAGES
require('mason-tool-installer').setup {
  ensure_installed = {
    -- javascript, typescript
    'prettierd',
    'eslint_d',
  },
  auto_update = true,
  run_on_start = true,
  start_delay = 3000, -- 3 second delay
}

-- FORMATTERS
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettierd" },
}

-- LINTERS
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d" },
}

-- CODE ACTIONS
-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     command = "proselint"
--   },
-- }
