require('mini.basics').setup({
	options = {
		basic = true,
		-- extra_ui is set to `false` and is instead set using the autocommand `mini-basics-extra-ui-workaround`
		extra_ui = false,
		win_borders = 'default',
	},
	mappings = {
		basic = true,
		option_toggle_prefix = [[\]],
		windows = true,
		move_with_alt = true,
	},
	autocommands = {
		basic = true,
		relnum_in_visual_mode = true,
	},
	silent = false,
})

vim.api.nvim_create_autocmd('OptionSet', {
	pattern = 'termguicolors',
	callback = function()
		-- Set options only if 'termguicolors' is set
		if not vim.o.termguicolors then return end

		vim.o.pumblend = 10 -- Make builtin completion menus slightly transparent
		vim.o.pumheight = 10 -- Make popup menu smaller
		vim.o.winblend = 10 -- Make floating windows slightly transparent

		vim.o.listchars = 'tab:> ,extends:…,precedes:…,nbsp:␣' -- Define which helper symbols to show
		vim.o.list = true -- Show some helper symbols

		-- Enable syntax highlighting if it wasn't already (as it is time consuming)
		if vim.fn.exists('syntax_on') ~= 1 then vim.cmd([[syntax enable]]) end
	end,
})
