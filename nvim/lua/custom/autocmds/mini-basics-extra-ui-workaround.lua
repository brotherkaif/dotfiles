-- NOTE: This autocmd is required due to not being able to evaluate `termguicolors` at the same time as mini-nvim
-- The function below will check the value of `termguicolors` and set transparency accordingly (as opposed to using the `extra_ui` setting in mini-basics)
vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'termguicolors',
  callback = function()
    -- Set options only if 'termguicolors' is set
    if not vim.o.termguicolors then return end

    vim.o.pumblend = 10 -- Make builtin completion menus slightly transparent
    vim.o.pumheight = 10 -- Make popup menu smaller
    vim.o.winblend = 10 -- Make floating windows slightly transparent

    vim.o.listchars = 'tab:> ,extends:…,precedes:…,nbsp:␣' -- Define which helper symbols to show
    vim.o.list = true -- Show some helper symbols

    -- Enable syntax highlighting if it wasn't already (as it is time consuming)
    if vim.fn.exists('syntax_on') ~= 1 then vim.cmd([[syntax enable]]) end
  end,
})
