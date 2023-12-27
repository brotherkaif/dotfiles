local isTrueColor = os.getenv("COLORTERM") == "truecolor"
local colorscheme = isTrueColor and "tokyonight-night" or "default"

return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = colorscheme,
  },
}
