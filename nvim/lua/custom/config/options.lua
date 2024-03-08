-- Disable mouse pop up
vim.cmd.aunmenu({ "PopUp.How-to\\ disable\\ mouse" })
vim.cmd.aunmenu({ "PopUp.-1-" })

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = false

-- Folding
vim.wo.foldmethod = "indent"
vim.wo.foldlevel = 2

-- Scroll offset
vim.o.scrolloff = 7

-- Set tab display
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Set Colorscheme
vim.cmd("colorscheme base16-black-metal-burzum")
