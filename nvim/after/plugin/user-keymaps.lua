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

vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope<CR>', { desc = 'Command Pallette' })
vim.keymap.set('n', '<BS>',
	'<cmd>lua require("telescope").extensions.file_browser.file_browser({ cwd = require("telescope.utils").buffer_dir() })<CR>',
	{ desc = 'Explorer' })

vim.keymap.set('n', '<leader>g', require('telescope.builtin').git_status, { desc = '[G]it: [G]it Source Control' })

-- Quality of life
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite Buffer' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit Buffer' })
vim.keymap.set('n', '<leader>i', '<cmd>colorscheme randomhue<CR>', { desc = 'Random [I]nterface Scheme' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = '[<Esc>] Normal Mode in Terminal' })
vim.keymap.set('n', '<leader>ts', '<cmd>ToggleTerm size=15 direction=horizontal<CR>', { desc = '[T]erminal: [S]plit' })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm size=60 direction=vertical<CR>',
	{ desc = '[T]erminal: [V]ertical Split' })
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = '[T]erminal: [F]ullscreen' })
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=tab<CR>', { desc = '[T]erminal: [T]ab' })

-- Cursor movement
vim.keymap.set('n', '<leader>h', '<C-W>h', { desc = '[H] Cursor Left' })
vim.keymap.set('n', '<leader>j', '<C-W>j', { desc = '[J] Cursor Down' })
vim.keymap.set('n', '<leader>k', '<C-W>k', { desc = '[K] Cursor Up' })
vim.keymap.set('n', '<leader>l', '<C-W>l', { desc = '[L] Cursor Right' })
vim.keymap.set('n', '<leader>H', '<C-W>H', { desc = '[H] Window Left' })
vim.keymap.set('n', '<leader>J', '<C-W>J', { desc = '[J] Window Down' })
vim.keymap.set('n', '<leader>K', '<C-W>K', { desc = '[K] Window Up' })
vim.keymap.set('n', '<leader>L', '<C-W>L', { desc = '[L] Window Right' })

-- Formatting keymaps
vim.keymap.set('n', '<leader>f', ':Format<cr>', { desc = 'Format', noremap = true, silent = true })
vim.keymap.set('n', '<leader>F', ':FormatWrite<cr>', { desc = 'Format and Save', noremap = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer]' })

-- Telescope keymaps
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- AI keymaps
vim.keymap.set('n', '<leader>ae', ':Copilot enable<cr>', { desc = '[A]I [E]nable' })
vim.keymap.set('n', '<leader>ad', ':Copilot disable<cr>', { desc = '[A]I [D]isable' })

-- UI keymaps
vim.keymap.set('n', '<leader>m', require('mini.map').toggle, { desc = '[S]earch [D]iagnostics' })
