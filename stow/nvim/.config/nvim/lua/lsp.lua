local lspconfig = require('lspconfig')
local util = require('lspconfig').util

-- Mappings.
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts) -- previous diagnostic
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts) -- next diagnostic
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- diagnostic hover
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts) -- diagnostic set local list

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- go to declaration
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- go to definition
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementations
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- go to references
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts) -- display hover information
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts) -- display signature information
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts) -- add workspace folder
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts) -- remove workspace folder
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts) -- list workspace folders
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts) -- type definition
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- rename
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- code action
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts) -- formatting
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
-- language: Ansible
-- requirements: 'npm', 'ansible-language-server'
-- command: npm i -g ansible-language-server
  'ansiblels',

-- language: BASH
-- requirements: 'npm', 'bash-language-server'
-- command: npm i -g bash-language-server
  'bashls',

-- languages: HTML/CSS/JSON
-- requirements: 'npm', 'vscode-langservers-extracted'
-- command: npm i -g vscode-langservers-extracted
  'html',
  'cssls',
  'jsonls',

-- language: JavaScript/TypeScript
-- requirements: 'npm', 'typescript', 'typescript-language-server'
-- command: npm install -g typescript typescript-language-server
  'tsserver',

-- language: YAML
-- requirements: 'npm', 'yaml-language-server'
-- command: npm install -g yaml-language-server
  'yamlls',
}

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

lspconfig.diagnosticls.setup{
    filetypes = {"javascript", "typescript"},
    root_dir = function(fname)
	return util.root_pattern("tsconfig.json")(fname) or
	util.root_pattern(".eslintrc.js")(fname);
    end,
    init_options = {
	linters = {
	    eslint = {
		command = "./node_modules/.bin/eslint",
		rootPatterns = {".eslintrc.js", ".git"},
	  	debounce = 100,
	  	args = {
		    "--stdin",
	  	    "--stdin-filename",
	  	    "%filepath",
	  	    "--format",
	  	    "json"
	  	},
		sourceName = "eslint",
		parseJson = {
		    errorsRoot = "[0].messages",
	    	    line = "line",
	    	    column = "column",
	    	    endLine = "endLine",
	    	    endColumn = "endColumn",
	    	    message = "[eslint] ${message} [${ruleId}]",
	    	    security = "severity"
		},
		securities = {
		    [2] = "error",
	    	    [1] = "warning"
		}
	    },
	},
	filetypes = {
	    javascript = "eslint",
	    typescript = "eslint"
	}
    }
}

if debug_mode==true then
  print('- lsp.lua...OK!')
end
