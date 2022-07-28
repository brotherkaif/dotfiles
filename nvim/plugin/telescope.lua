local telescope = require('telescope')

telescope.setup({
	defaults = {
		hidden = true,
		layout_strategy = 'flex',
		color_devicons = false,
		layout_config = {
			height = 0.75,
			width = 0.75
		},
	},

	extensions = {
		file_browser = {
			dir_icon = '›',
			grouped = true,
			hidden = true,
			sorting_strategy = 'ascending',
			layout_config = {
				prompt_position = 'top',
			},
		},
	},
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
