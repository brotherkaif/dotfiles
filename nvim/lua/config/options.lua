vim.opt["scrolloff"] = 8
vim.opt["sidescrolloff"] = 8

vim.wo["foldlevel"] = 4
vim.wo["foldmethod"] = "indent"

vim.wo["scrolloff"] = 8
vim.wo["sidescrolloff"] = 8

vim.opt["termguicolors"] = true

local scheme = "colorscheme randomhue"
vim.cmd(scheme)
