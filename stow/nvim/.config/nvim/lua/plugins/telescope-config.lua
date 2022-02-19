require('telescope').setup({
    pickers = {
	find_files = {
	    disable_devicons = true,
	},
	git_files = {
	    disable_devicons = true,
	},
	current_buffer_fuzzy_find = {
	    sorting_strategy = 'ascending',

	    layout_config = {
		prompt_position = 'top'
	    },
	},
	live_grep = {
	    sorting_strategy = 'ascending',

	    layout_config = {
		prompt_position = 'top'
	    },
	},
    },
    extensions = {
	file_browser = {
	    dir_icon = '›',
	    grouped = true,
	    sorting_strategy = 'ascending',
	    layout_config = {
		prompt_position = 'top'
	    },
	},
    },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

if debug_mode==true then
  print('- plugins/telescope-config.lua...OK!')
end
