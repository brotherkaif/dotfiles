require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
	clangd = {},
	gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	-- html = { filetypes = { 'html', 'twig', 'hbs'} },
	tsserver = {},
	marksman = {},
	biome = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			diagnostics = { disable = { 'missing-fields' } },
		},
	},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Ensure the servers above are installed
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end,
})
