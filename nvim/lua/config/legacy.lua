-- Check if the terminal does not have truecolor
if os.getenv("COLORTERM") ~= "truecolor" then
	-- disable termguicolors
	vim.opt["termguicolors"] = false

	-- set default colorscheme
	vim.cmd("colorscheme default")
end
