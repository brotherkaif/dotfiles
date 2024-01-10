return {
	"akinsho/toggleterm.nvim",
	config = true,
	cmd = "ToggleTerm",
	keys = {
		{ "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal", { noremap = true, silent = true } },
		{
			"<Esc><Esc>",
			"<C-\\><C-n>",
			mode = "t",
			desc = "Toggle floating terminal",
			{
				noremap = true,
				silent = true
			}
		},
	},
	opts = {
		open_mapping = [[<C-\>]],
		direction = "horizontal",
		hide_numbers = true,
		insert_mappings = true,
		terminal_mappings = true,
		start_in_insert = true,
		close_on_exit = true,
		size = 25
	},
}
