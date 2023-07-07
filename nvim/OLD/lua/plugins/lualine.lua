return {
	-- lualine - A blazing fast and easy to configure Neovim statusline written in Lua.
	"nvim-lualine/lualine.nvim",
	config = function()
		-- Check if the terminal has truecolor
		if os.getenv("COLORTERM") == "truecolor" then
			require("lualine").setup({
				theme = "auto",
			})
		else
			-- disable icons
			require("lualine").setup({
				options = {
					icons_enabled = false,
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
				}
			})
		end
	end,
}
