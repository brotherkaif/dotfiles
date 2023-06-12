-- LSP servers to be automatically installed via mason
local install_list = {
	"bashls",
	"clangd",
	"marksman",
	"pyright",
	"rust_analyzer",
	"sqlls",
	"lua_ls",
	"tsserver",
	"yamlls",
}

-- LSP servers to be automatically configured
local config_list = {
	"bashls",
	"clangd",
	"marksman",
	"pyright",
	"sqlls",
	"tsserver",
	"yamlls",
}

return {
	-- LSP - Configuration & Plugin
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			-- Automatically install LSPs to stdpath for neovim
			-- Setup mason so it can manage external tooling
			"williamboman/mason.nvim",
			config = true
		},

		{
			-- Ensure the packages below are installed
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = install_list,
			}
		},

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ 'j-hui/fidget.nvim', opts = {} },

		{
			-- A plugin to improve your rust experience in neovim.
			"simrat39/rust-tools.nvim",
			config = true
		}
	},

	config = function()
		-- This function gets run when an LSP connects to a particular buffer.
		local on_attach = function(_, bufnr)
			-- NOTE: Remember that lua is a real programming language, and as such it is possible
			-- to define small helper and utility functions so you don't have to repeat yourself
			-- many times.

			-- In this case, we create a function that lets us more easily define mappings specific
			-- for LSP related items. It sets the mode, buffer and description for us each time.
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("gn", vim.lsp.buf.rename, "[G]oto Re[n]ame Dialog")
			nmap("ga", vim.lsp.buf.code_action, "[G]oto Code [A]ction")
			nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			-- See `:help K` for why this keymap
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- Lesser used LSP functionality
			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
			nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "[W]orkspace [L]ist Folders")

			-- Create a command `:Format` local to the LSP buffer
			vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
				if vim.lsp.buf.format then
					vim.lsp.buf.format()
				elseif vim.lsp.buf.formatting then
					vim.lsp.buf.formatting()
				end
			end, { desc = "Format current buffer with LSP" })
		end

		-- COMPLETION CONFIGURATION
		-- nvim-cmp supports additional completion capabilities
		local generic_capabilities = vim.lsp.protocol.make_client_capabilities()

		-- GENERIC CONFIGURATION
		-- auto config of servers in `config_list`
		for _, lsp in ipairs(config_list) do
			require("lspconfig")[lsp].setup({
				on_attach = on_attach,
				capabilities = generic_capabilities,
			})
		end

		-- LUA CONFIGURATION
		-- Make runtime files discoverable to the server
		local lua_runtime_path = vim.split(package.path, ";")
		table.insert(lua_runtime_path, "lua/?.lua")
		table.insert(lua_runtime_path, "lua/?/init.lua")

		local lua_opts = {
			on_attach = on_attach,
			capabilities = generic_capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you"re using (most likely LuaJIT)
						version = "LuaJIT",
						-- Setup your lua path
						path = lua_runtime_path,
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = { enable = false },
				},
			},
		}

		require("lspconfig").lua_ls.setup(lua_opts)

		-- RUST CONFIGURATION
		-- Configure LSP through rust-tools.nvim plugin.
		-- rust-tools will configure and enable certain LSP features for us.
		-- See https://github.com/simrat39/rust-tools.nvim#configuration
		local rust_opts = {
			tools = {
				runnables = {
					use_telescope = true,
				},
				inlay_hints = {
					auto = true,
					show_parameter_hints = false,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
				},
			},

			-- all the opts to send to nvim-lspconfig
			-- these override the defaults set by rust-tools.nvim
			-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
			server = {
				-- on_attach is a callback called when the language server attachs to the buffer
				on_attach = on_attach,
				settings = {
					-- to enable rust-analyzer settings visit:
					-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
					["rust-analyzer"] = {
						-- enable clippy on save
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
		}

		require("rust-tools").setup(rust_opts)
	end
}
