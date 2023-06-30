vim.opt["scrolloff"] = 8
vim.opt["sidescrolloff"] = 8

vim.wo["foldlevel"] = 4
vim.wo["foldmethod"] = "indent"

vim.wo["scrolloff"] = 8
vim.wo["sidescrolloff"] = 8

vim.opt["termguicolors"] = true

local background = vim.api.nvim_get_option("background")

if background == "dark" then
	local scheme = "colorscheme rose-pine-moon"
	vim.cmd(scheme)
else
	local scheme = "colorscheme rose-pine-dawn"
	vim.cmd(scheme)
end
