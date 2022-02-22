require('telescope').setup({
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
	},
    },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

if debug_mode==true then
  print('- plugins/telescope-config.lua...OK!')
end
