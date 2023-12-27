local isTrueColor = os.getenv("COLORTERM") == "truecolor"

-- TODO: update this to use default theme in future
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
