local actions = require('telescope.actions')
local custom_actions = {}
local telescope = require('telescope')

telescope.setup({
	defaults = {
	hidden = true,
	layout_strategy = 'flex',
	sorting_strategy = 'ascending',
	layout_config = {
		prompt_position = 'top',
	},
	color_devicons = false,
	},

	extensions = {
		file_browser = {
			dir_icon = '›',
			grouped = true,
			hidden = true,
		},
	},
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
