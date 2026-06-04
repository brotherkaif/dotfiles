-- ┌─────────────────────────┐
-- │ Plugins outside of MINI │
-- └─────────────────────────┘

-- Make concise helpers for installing/adding plugins in two stages
local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

-- Tree-sitter ================================================================

now_if_args(function()
  -- Define hook to update tree-sitter parsers after plugin is updated
  local ts_update = function() vim.cmd('TSUpdate') end
  Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')

  add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  })

  local languages = {
    'lua', 'vimdoc', 'markdown',
    -- add more languages here as needed
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- Language servers ===========================================================

local servers = {
  clangd = {},
  cssls = {},
  eslint = {},
  gopls = {},
  html = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        disable = { 'missing-fields' },
        globals = { 'vim' },
      },
    },
  },
  ts_ls = {},
}

now_if_args(function()
  add({ 'https://github.com/neovim/nvim-lspconfig' })

  local lspconfig = require('lspconfig')
  for server_name, server_config in pairs(servers) do
    lspconfig[server_name].setup({
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      settings = server_config,
    })
  end
end)

-- Formatting =================================================================

later(function()
  add({
    'https://github.com/stevearc/conform.nvim',
  })

  require('conform').setup({
    default_format_opts = {
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      astro = { 'biome', 'prettier', stop_after_first = true },
      css = { 'biome', 'prettier', stop_after_first = true },
      graphql = { 'biome', 'prettier', stop_after_first = true },
      handlebars = { 'biome', 'prettier', stop_after_first = true },
      html = { 'biome', 'prettier', stop_after_first = true },
      javascript = { 'eslint_d', 'biome', 'prettier', stop_after_first = true },
      javascriptreact = { 'biome', 'prettier', stop_after_first = true },
      json = { 'biome', 'prettier', stop_after_first = true },
      jsonc = { 'biome', 'prettier', stop_after_first = true },
      less = { 'biome', 'prettier', stop_after_first = true },
      markdown = { 'biome', 'prettier', 'markdownlint', stop_after_first = true },
      scss = { 'biome', 'prettier', stop_after_first = true },
      svelte = { 'biome', 'prettier', stop_after_first = true },
      typescript = { 'eslint_d', 'biome', 'prettier', stop_after_first = true },
      typescriptreact = { 'biome', 'prettier', stop_after_first = true },
      vue = { 'biome', 'prettier', stop_after_first = true },
      yaml = { 'biome', 'prettier', stop_after_first = true },
    },
    formatters = {
      eslint_d = {
        cwd = require('conform.util').root_file({ 'package.json' }),
        require_cwd = true,
      },
      prettier = {
        cwd = require('conform.util').root_file({ 'package.json' }),
        require_cwd = true,
      },
      biome = {
        cwd = require('conform.util').root_file({ 'package.json' }),
        require_cwd = true,
      },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match('/node_modules/') then return end
      return { timeout_ms = 500, lsp_format = 'never' }
    end,
  })
end)

-- Snippets ===================================================================

later(function() add({ 'https://github.com/rafamadriz/friendly-snippets' }) end)

-- Mason ======================================================================

now_if_args(function()
  add({
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  })

  require('mason').setup()

  require('mason-lspconfig').setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_enable = true,
  })

  require('mason-tool-installer').setup({
    ensure_installed = {
      'stylua', 'biome', 'markdownlint', 'eslint_d', 'js-debug-adapter',
    },
    start_delay = 3000,
    debounce_hours = 5,
  })
end)

-- Debugging ==================================================================

later(function()
  add({
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/rcarriga/nvim-dap-ui',
    'https://github.com/nvim-neotest/nvim-nio',
  })

  local dap = require('dap')
  local dapui = require('dapui')

  dap.adapters['pwa-node'] = {
    type = 'server',
    host = 'localhost',
    port = '${port}',
    executable = {
      command = 'node',
      args = {
        vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js',
        '${port}',
      },
    },
    options = { max_retries = 35 },
  }

  local js_config = {
    {
      type = 'pwa-node', request = 'launch', name = 'Launch current file',
      program = '${file}', cwd = '${workspaceFolder}',
    },
    {
      type = 'pwa-node', request = 'attach', name = 'Attach to process',
      processId = require('dap.utils').pick_process, cwd = '${workspaceFolder}',
    },
    {
      type = 'pwa-node', request = 'launch', name = 'FABL: Execute module',
      program = '${workspaceFolder}/node_modules/.bin/fabl',
      args = function()
        local args_str = vim.fn.input("fabl execute args (e.g. -p 'id=123'): ")
        local args = { 'execute', '--no-sandbox' }
        for arg in args_str:gmatch('%S+') do table.insert(args, arg) end
        return args
      end,
      cwd = '${workspaceFolder}', sourceMaps = true,
      autoAttachChildProcesses = true, resolveSourceMapLocations = nil,
      skipFiles = { '<node_internals>/**' },
    },
    {
      type = 'pwa-node', request = 'attach', name = 'Vitest: Run tests (cwd)',
      port = 9229, cwd = '${workspaceFolder}', sourceMaps = true,
      resolveSourceMapLocations = nil, skipFiles = { '<node_internals>/**' },
      continueOnAttach = true,
    },
    {
      type = 'pwa-node', request = 'attach', name = 'Vitest: Run current file (cwd)',
      port = 9229, cwd = '${workspaceFolder}', sourceMaps = true,
      resolveSourceMapLocations = nil, skipFiles = { '<node_internals>/**' },
      continueOnAttach = true,
    },
  }

  dap.configurations.javascript = js_config
  dap.configurations.typescript = js_config

  dapui.setup()
  dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
  dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
  dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
end)

-- Extra Plugins ==============================================================

-- Copilot
later(function()
  add({ 'https://github.com/github/copilot.vim' })
  vim.cmd(':Copilot disable')
end)
