return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	config = function()
		-- Check if the terminal has truecolor
		if os.getenv("COLORTERM") == "truecolor" then
			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true
				},
			})
		else
			-- disable icons
			require("nvim-tree").setup({
				renderer = {
					icons = {
						show = {
							file = false,
							folder = false,
							folder_arrow = false,
							git = false,
						}
					}
				},

				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true
				},
			})
		end
	end,

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
