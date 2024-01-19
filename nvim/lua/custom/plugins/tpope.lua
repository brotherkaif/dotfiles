return {
	-- The obligatory tpope section
	{
		'tpope/vim-fugitive',
		keys = {
			{
				'<leader>gg', '<cmd>Git<CR>', desc = '[G]it Manager',
			},
		},
	},
	{ 'tpope/vim-rhubarb' },
	{ 'tpope/vim-sleuth' },
}
