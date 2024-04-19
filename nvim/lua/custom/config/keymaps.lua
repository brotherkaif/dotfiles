-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- vim.keymap.set('n', '<leader>tt', ':lua ToggleBackground()<CR>', { noremap = true, desc = '[T]oggle Background [T]heme' })
--
-- function ToggleBackground()
--   if vim.o.background == 'light' then
--     vim.o.background = 'dark'
--   else
--     vim.o.background = 'light'
--   end
-- end
