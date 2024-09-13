MiniDeps.add("stevearc/conform.nvim")

require("conform").setup({
	-- Map of filetype to formatters
	formatters_by_ft = {
		javascript = { "prettier", "eslint" },
		typescript = { "prettier", "eslint" },
		json = { "prettier" },
		lua = { "stylua" },
	},
})
