MiniDeps.add({
	source = "neovim/nvim-lspconfig",
	depends = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
})

require("mason").setup()

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
			-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			diagnostics = {
				disable = { "missing-fields" },
				globals = { "vim" },
			},
		},
	},
	marksman = {},
	ts_ls = {},
}

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		})
	end,
})
