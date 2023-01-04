-- Modes Reference
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.keymap.set('n', '<leader>p', "<cmd>Telescope<CR>", { desc = "Command [P]allette" })
vim.keymap.set('n', '-', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ cwd = require("telescope.utils").buffer_dir() })<CR>', { desc = 'Explorer' })

vim.keymap.set('n', '<leader>g', "<cmd>Git<CR>", { desc = "[G]it: [G]it Source Control" })


-- keymap("v", "<", "<gv", opts) -- shift lines left
-- keymap("v", "J", ":m .+1<CR>==", opts) -- shift lines down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts) -- shift lines down
-- keymap("v", "K", ":m .-2<CR>==", opts) -- shift lines up
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts) -- shift lines up
-- keymap("v", ">", ">gv", opts) -- shift lines right

-- TODO: l -> [L]SP: 
-- TODO: p -> [P]acker: 
-- TODO: s -> [S]earch: 
-- TODO: t -> [T]reesitter: 

-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- # Tools
-- keymap('n', '<leader><leader>', '<cmd>:Telescope<CR>', opts) -- telescope command pallette
-- keymap('n', '<leader>t', ':FloatermToggle<CR>', opts) -- open terminal
-- keymap('t', '<Esc><Esc>', '<C-\\><C-n>', opts) -- normal mode within terminal window
-- keymap('n', '<leader>g', '<cmd>lua require("telescope.builtin").git_status()<CR>', opts) -- git status

-- # Buffers
-- keymap('n', '<leader>br', ':e<CR>', opts) -- reload buffer
-- keymap('n', '<leader>bs', ':setlocal spell! spelllang=en_gb,en_us<CR>', opts) -- toggle spellcheck
-- keymap('n', '<leader>bf', '<cmd>lua vim.lsp.buf.format()<CR>', opts) -- format buffer
-- keymap('n', '<leader>/b', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', opts) -- grep buffer
-- keymap("n", "]b", ":bnext<CR>", opts) -- next buffer
-- keymap("n", "[b", ":bprevious<CR>", opts) -- previous buffer

-- # Navigation
-- keymap('n', '<leader>f', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts) -- find file
-- keymap('n', '<leader>/f', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts) -- grep files
-- keymap('n', ']q', ':cn<CR>', opts) -- next quick fix
-- keymap('n', '[q', ':cp<CR>', opts) -- previous quick fix

-- # Windows
-- keymap('n', '<leader>h', '<C-W>h', opts) -- cursor left
-- keymap('n', '<leader>j', '<C-W>j', opts) -- cursor down
-- keymap('n', '<leader>k', '<C-W>k', opts) -- cursor up
-- keymap('n', '<leader>l', '<C-W>l', opts) -- cursor right
-- keymap('n', '<leader>H', '<C-W>H', opts) -- window left
-- keymap('n', '<leader>J', '<C-W>J', opts) -- window down
-- keymap('n', '<leader>K', '<C-W>K', opts) -- window up
-- keymap('n', '<leader>L', '<C-W>L', opts) -- window right
-- keymap("n", "<leader><Left>", ":vertical resize -2<CR>", opts) -- decrease horizontal size
-- keymap("n", "<leader><Down>", ":resize -2<CR>", opts) -- decrease vertical size
-- keymap("n", "<leader><Up>", ":resize +2<CR>", opts) -- increase vertical size
-- keymap("n", "<leader><Right>", ":vertical resize +2<CR>", opts) -- increase horizontal size
-- keymap('n', '<leader>ww', ':w<CR>', opts) -- window buffer write
-- keymap('n', '<leader>wq', ':q<CR>', opts) -- window buffer quit
-- keymap('n', '<leader>wx', ':split<CR>', opts) -- split horizontal
-- keymap('n', '<leader>wv', ':vsplit<CR>', opts) -- split vertical
-- keymap('n', '<leader>wt', '<C-W>T', opts) -- window to tab
-- keymap('n', '<leader>we', '<C-W>=', opts) -- equalise buffer windows
-- keymap('n', '<leader>wo', '<C-W>o', opts) -- close other buffer windows
-- keymap('n', '<leader>wm', '<C-W>_<C-W>|', opts) -- maximise buffer window

-- # Interface
-- keymap('n', '<leader>il', ':set background=light<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>', opts) -- set theme to light
-- keymap('n', '<leader>id', ':set background=dark<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>', opts) -- set theme to dark
-- keymap('n', '<leader>in', ':set relativenumber!<CR>', opts) -- toggle relative line numbers
-- keymap('n', '<leader>ic', ':set list!<CR>', opts) -- toggle display unprintable chars

-- # LSP
-- config-lsp.lua

-- # DAP
-- config-dap.lua

-- # Completion
-- cmp.lua


