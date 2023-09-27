-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Fold level
vim.wo.foldlevel = 4
vim.wo.foldmethod = "indent"

-- Disable mouse pop up
vim.cmd.aunmenu({ "PopUp.How-to\\ disable\\ mouse" })
vim.cmd.aunmenu({ "PopUp.-1-" })

-- Disable conceal
vim.o.conceallevel = 0

-- Terminal truecolor fallback
if os.getenv("COLORTERM") ~= "truecolor" then
  -- disable termguicolors
  vim.opt.termguicolors = false

  -- set default colorscheme
  vim.cmd("colorscheme default")
else
  -- enable termguicolors
  vim.opt.termguicolors = true
  vim.cmd("colorscheme default")
end
