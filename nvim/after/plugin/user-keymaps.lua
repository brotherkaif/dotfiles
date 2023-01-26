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
vim.keymap.set('n', '<leader><left>', '<<', { desc = 'Shift Lines [Left]', noremap = true, silent = true})
vim.keymap.set('n', '<leader><right>', '>>', { desc = 'Shift Lines [Right]', noremap = true, silent = true})
vim.keymap.set('x', '<leader><down>', ':MoveBlock 1<CR>', { desc = 'Shift Lines [Down]', noremap = true, silent = true})
vim.keymap.set('x', '<leader><up>', ':MoveBlock -1<CR>', { desc = 'Shift Lines [Up]', noremap = true, silent = true})
vim.keymap.set('v', '<leader><left>', '<<', { desc = 'Shift Lines [Left]', noremap = true, silent = true})
vim.keymap.set('v', '<leader><right>', '>>', { desc = 'Shift Lines [Right]', noremap = true, silent = true})

vim.keymap.set('n', '<leader><leader>s', ':HopChar<cr>', { desc = 'Hop: Search character', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>f', ':HopChar1AC<cr>', { desc = 'Hop: Find character forwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>F', ':HopChar1BC<cr>', { desc = 'Hop: Find character backwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>t', ':HopChar1AC<cr>', { desc = 'Hop: Til character forwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>T', ':HopChar1BC<cr>', { desc = 'Hop: Til character backwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>w', ':HopWordAC<cr>', { desc = 'Hop: Start of word forwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>b', ':HopWordBC<cr>', { desc = 'Hop: Start of word backwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>l', ':HopWordAC<cr>', { desc = 'Hop: Matches beginning & ending of word forwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>h', ':HopWordBC<cr>', { desc = 'Hop: Matches beginning & ending of word backwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>e', ':HopWordAC<cr>', { desc = 'Hop: End of word forwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>ge', ':HopWordBC<cr>', { desc = 'Hop: End of word backwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>j', ':HopLineStartAC<cr>', { desc = 'Hop: Start of line forwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>k', ':HopLineStartBC<cr>', { desc = 'Hop: Start of line backwards', noremap = true, silent = true })
vim.keymap.set('n', '<leader><leader>["/"]', ':HopPattern<cr>', { desc = 'Hop: Search n-character', noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = '[[] Previous [D]iagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = '[]] Next [D]iagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic Op[E]n Float ' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic Open [Q]uickfix List' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
