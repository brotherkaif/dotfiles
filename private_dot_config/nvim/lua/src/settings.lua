--stylua: ignore start
vim.g.mapleader = " "

vim.o.backup = false				-- Don't store backup
vim.o.writebackup = false		-- Don't write backup
vim.o.writebackup = false		-- Don't write backup
vim.o.undofile = true				-- Enable persistent undo

vim.cmd.aunmenu({ "PopUp.How-to\\ disable\\ mouse" })	-- Disable mouse pop up
vim.cmd.aunmenu({ "PopUp.-1-" })											-- Disable mouse pop up

vim.api.nvim_set_option("clipboard", "unnamedplus")		-- Sync clipboard between OS and Neovim

vim.o.breakindent = true		-- Indent wrapped lines to match line start
vim.o.scrolloff = 7

vim.o.foldmethod = "indent"	-- Set 'indent' folding method
vim.o.foldlevel = 3					-- Display all folds except top three
vim.o.foldnestmax = 10			-- Create folds only for some number of nested levels
vim.g.markdown_folding = 1	-- Use folding by heading in markdown files

if vim.fn.has("nvim-0.10") == 1 then
  vim.o.foldtext = ""				-- Use underlying text with its highlighting
end

vim.o.tabstop = 2						-- Insert 2 spaces for a tab
vim.o.softtabstop = 2
vim.o.shiftwidth = 2				-- Use this number of spaces for indentation

vim.g.disable_autoformat = true
