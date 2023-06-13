vim.opt["scrolloff"] = 8
vim.opt["sidescrolloff"] = 8

vim.wo["foldlevel"] = 4
vim.wo["foldmethod"] = "indent"

-- Mac only options
if vim.fn.has("mac") then
  vim.opt["termguicolors"] = false
else
  vim.opt["termguicolors"] = true
	vim.cmd("colorscheme randomhue")
end
