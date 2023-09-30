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
vim.opt.conceallevel = 0

-- Truecolor fallback
local trueColor = os.getenv("COLORTERM") == "truecolor"
if not trueColor then
  vim.opt.termguicolors = false
  vim.opt.pumblend = 0
end
