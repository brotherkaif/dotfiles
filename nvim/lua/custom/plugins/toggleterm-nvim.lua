return {
	"akinsho/toggleterm.nvim",
	config = true,
	cmd = "ToggleTerm",
	keys = {
		{ "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "toggle terminal (horizontal)", { noremap = true, silent = true } },
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
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
	},
}
