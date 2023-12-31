return {
	'echasnovski/mini.pick',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	keys = {
		{ '<leader><space>', function() require('mini.pick').builtin.buffers() end,   desc = 'Open buffers picker' },
		{ '<leader>ff',      function() require('mini.pick').builtin.files() end,     desc = 'Open file picker' },
		{ '<leader>fh',      function() require('mini.pick').builtin.help() end,      desc = 'Open help tags picker' },
		{ '<leader>fg',      function() require('mini.pick').builtin.grep_live() end, desc = 'Open grep picker' },
	},
}
