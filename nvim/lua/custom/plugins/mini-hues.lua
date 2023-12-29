return {
	'echasnovski/mini.hues',
	keys = {
		{ '<leader>cc', function() vim.cmd('colorscheme randomhue') end, desc = '[c]olors[c]heme randomhue' },
		{ '<leader>cd', function() vim.cmd('colorscheme default') end,   desc = '[c]olorscheme [d]efault' },
	},
}
