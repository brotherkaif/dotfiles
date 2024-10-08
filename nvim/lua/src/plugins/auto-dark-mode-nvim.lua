MiniDeps.add("f-person/auto-dark-mode.nvim")

require("auto-dark-mode").setup({
	update_interval = 1000,

	set_dark_mode = function()
		vim.api.nvim_set_option("background", "dark")
		vim.cmd("colorscheme default")
	end,

	set_light_mode = function()
		vim.api.nvim_set_option("background", "light")
		vim.cmd("colorscheme default")
	end,
})
