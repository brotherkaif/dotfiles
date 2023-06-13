local M = {}

function M.ToggleBackground()
  local bg = vim.api.nvim_get_option("background")
  local set_highlights = require("scripts.highlights")

  if bg == "dark" then
    vim.api.nvim_set_option("background", "light")
	set_highlights.SetHighlights()

    print("Background set to light")
  else
    vim.api.nvim_set_option("background", "dark")
	set_highlights.SetHighlights()

    print("Background set to dark")
  end
end

return M
