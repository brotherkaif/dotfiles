-- Modes Reference
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Remap for visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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

vim.keymap.set('n', '<leader><down>', ':MoveLine 1<CR>', { desc = 'Shift Lines [Down]', noremap = true, silent = true})
vim.keymap.set('n', '<leader><up>', ':MoveLine -1<CR>', { desc = 'Shift Lines [Up]', noremap = true, silent = true})
vim.keymap.set('n', '<leader><left>', ':MoveHChar -1<CR>', { desc = 'Shift Lines [Left]', noremap = true, silent = true})
vim.keymap.set('n', '<leader><right>', ':MoveHChar 1<CR>', { desc = 'Shift Lines [Right]', noremap = true, silent = true})
vim.keymap.set('x', '<leader><down>', ':MoveBlock 1<CR>', { desc = 'Shift Lines [Down]', noremap = true, silent = true})
vim.keymap.set('x', '<leader><up>', ':MoveBlock -1<CR>', { desc = 'Shift Lines [Up]', noremap = true, silent = true})
vim.keymap.set('v', '<leader><left>', ':MoveHBlock -1<CR>', { desc = 'Shift Lines [Left]', noremap = true, silent = true})
vim.keymap.set('v', '<leader><right>', ':MoveHBlock 1<CR>', { desc = 'Shift Lines [Right]', noremap = true, silent = true})
