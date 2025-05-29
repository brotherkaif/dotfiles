MiniDeps.add({
	source = "neovim/nvim-lspconfig",
	depends = {
		{
			source = "mason-org/mason.nvim",
		},
		{
			source = "mason-org/mason-lspconfig.nvim",
		},
	},
})

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
				disable = { "missing-fields" },
				globals = { "vim", "MiniDeps" },
			},
		},
	},
	ts_ls = {},
}

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(servers),
	automatic_enable = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

for server_name, server_config in pairs(servers) do
	vim.lsp.config(server_name, {
		capabilities = capabilities,
		settings = server_config,
	})
end
