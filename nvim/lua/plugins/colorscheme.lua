local isTrueColor = os.getenv("COLORTERM") == "truecolor"

if isTrueColor then
  return {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  }
else
  vim.opt["termguicolors"] = false

  return {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "default",
    },
  }
end
