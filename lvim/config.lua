lvim.format_on_save = true
lvim.lsp.diagnostics.virtual_text = true
lvim.colorscheme = "onenord"

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

-- PLUGINS
lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" }
}
