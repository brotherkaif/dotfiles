-- local maccolorscheme = "colorscheme zenburn"

vim.opt["scrolloff"] = 8
vim.opt["sidescrolloff"] = 8

-- Mac only options
if vim.fn.has("mac") then
  vim.opt["termguicolors"] = false
  -- vim.cmd(maccolorscheme)
else
  vim.opt["termguicolors"] = true
end

vim.wo["foldlevel"] = 4
vim.wo["foldmethod"] = "indent"
