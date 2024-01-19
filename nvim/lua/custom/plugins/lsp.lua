-- NOTE: This is where your plugins related to LSP can be installed.
-- The configuration is done below. Search for lspconfig to find it below.
return {
	-- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ 'j-hui/fidget.nvim',       opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		'folke/neodev.nvim',
	},
	config = function()
		-- [[ Configure LSP ]]
		--  This function gets run when an LSP connects to a particular buffer.
		local on_attach = function(_, bufnr)
			-- NOTE: Remember that lua is a real programming language, and as such it is possible
			-- to define small helper and utility functions so you don't have to repeat yourself
			-- many times.
			--
			-- In this case, we create a function that lets us more easily define mappings specific
			-- for LSP related items. It sets the mode, buffer and description for us each time.
			local nmap = function(keys, func, desc)
				if desc then
					desc = 'LSP: ' .. desc
				end

				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
			end

			nmap('<space>e', vim.diagnostic.open_float, 'Open Float')
			nmap('<space>q', vim.diagnostic.setloclist, 'Set Local List')
			nmap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
			nmap('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')

			-- See `:help K` for why this keymap
			nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

			-- Lesser used LSP functionality
			nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
			nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
			nmap('gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
			nmap('gr', vim.lsp.buf.references, '[g]oto [r]eferences')
			nmap('<space>D', vim.lsp.buf.type_definition, 'type [D]efinition')
			nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace [a]dd Folder')
			nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace [r]emove Folder')
			nmap('<leader>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, '[w]orkspace [l]ist folders')

			-- Create a command `:Format` local to the LSP buffer
			vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
				vim.lsp.buf.format()
			end, { desc = 'Format current buffer with LSP' })
		end

		-- mason-lspconfig requires that these setup functions are called in this order
		-- before setting up the servers.
		require('mason').setup()
		require('mason-lspconfig').setup()

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. They will be passed to
		--  the `settings` field of the server config. You must look up that documentation yourself.
		--
		--  If you want to override the default filetypes that your language server will attach to you can
		--  define the property 'filetypes' to the map in question.
		local servers = {
			clangd = {},
			-- gopls = {},
			-- pyright = {},
			-- rust_analyzer = {},
			-- html = { filetypes = { 'html', 'twig', 'hbs'} },

			tsserver = {},

			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
					diagnostics = { disable = { 'missing-fields' } },
				},
			},
		}

		-- Setup neovim lua configuration
		require('neodev').setup()

		-- TODO: delete this
		-- -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		-- Ensure the servers above are installed
		local mason_lspconfig = require 'mason-lspconfig'

		mason_lspconfig.setup {
			ensure_installed = vim.tbl_keys(servers),
		}

		mason_lspconfig.setup_handlers {
			function(server_name)
				require('lspconfig')[server_name].setup {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				}
			end,
		}
	end,
}
