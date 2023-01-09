-- Modes Reference
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.keymap.set('n', '<leader>p', '<cmd>Telescope<CR>', { desc = 'Command [P]allette' })
vim.keymap.set('n', '-', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ cwd = require("telescope.utils").buffer_dir() })<CR>', { desc = 'Explorer' })

vim.keymap.set('n', '<leader>g', '<cmd>Git<CR>', { desc = '[G]it: [G]it Source Control' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = '[<Esc>] Normal Mode in Terminal' })
vim.keymap.set('n', '<leader>ts', '<cmd>split | terminal<CR>', { desc = '[T]erminal: [S]plit' })
vim.keymap.set('n', '<leader>tv', '<cmd>vsplit | terminal<CR>', { desc = '[T]erminal: [V]ertical Split' })
vim.keymap.set('n', '<leader>tf', '<cmd>terminal<CR>', { desc = '[T]erminal: [F]ullscreen' })

vim.keymap.set('n', '<leader>h', '<C-W>h', { desc = '[H] Cursor Left' })
vim.keymap.set('n', '<leader>j', '<C-W>j', { desc = '[J] Cursor Down' })
vim.keymap.set('n', '<leader>k', '<C-W>k', { desc = '[K] Cursor Up' })
vim.keymap.set('n', '<leader>l', '<C-W>l', { desc = '[L] Cursor Right' })
vim.keymap.set('n', '<leader>H', '<C-W>H', { desc = '[H] Window Left' })
vim.keymap.set('n', '<leader>J', '<C-W>J', { desc = '[J] Window Down' })
vim.keymap.set('n', '<leader>K', '<C-W>K', { desc = '[K] Window Up' })
vim.keymap.set('n', '<leader>L', '<C-W>L', { desc = '[L] Window Right' })

-- vim.keymap.set("v", "<", "<gv", { desc = '[<] Shift Lines Left' })
-- vim.keymap.set("v", "J", ":m .+1<CR>==", { desc = '[J] Shift Lines Down' })
-- vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv'", { desc = '[J] Shift Lines Down' })
-- vim.keymap.set("v", "K", ":m .-2<CR>==", { desc = '[K] Shift Lines Up' })
-- vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv'", { desc = '[K] Shift Lines Up' })
-- vim.keymap.set("v", ">", ">gv", { desc = '[<] Shift Lines Right' })
