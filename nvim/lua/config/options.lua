vim.opt["scrolloff"] = 8
vim.opt["sidescrolloff"] = 8

vim.wo["foldlevel"] = 4
vim.wo["foldmethod"] = "indent"

-- Mac only options
if vim.fn.has("mac") == 1 then
  vim.opt["termguicolors"] = false
else
  vim.opt["termguicolors"] = true

  local scheme = "colorscheme randomhue"
  vim.cmd(scheme)
end
