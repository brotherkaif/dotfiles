return {
	'echasnovski/mini.files',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		windows = {
			preview = true,
			width_focus = 30,
			width_preview = 60,
		},
		options = {
			use_as_default_explorer = true,
			show_dotfiles = true,
		},
	},
	keys = {
		{
			'<leader>fm',
			function()
				require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
			end,
			desc = '[f]ile [m]ap (file)',
		},
		{
			'<leader>fM',
			function()
				require('mini.files').open(vim.loop.cwd(), true)
			end,
			desc = '[f]ile [M]ap (cwd)',
		},
	},
}
