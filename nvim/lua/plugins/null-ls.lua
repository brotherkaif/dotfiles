-- linters and formatters that will be installed and configured by mason-null-ls respectively
local install_list = {
	"emmet_ls",
	"eslint",
	"prettier",
}

-- additional that are not supported by mason
-- local builtins = {
-- 	require("null-ls").builtins.completion.spell,
-- }

return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-null-ls").setup({
			ensure_installed = install_list,
			automatic_installation = false,
			handlers = {},
		})
		-- require("null-ls").setup({
		-- 	sources = builtins,
		-- })
	end,
}
