-- common options
local opts = {noremap = true, silent = true}

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- <leader> = space
vim.g.mapleader = " "

-- # Tools
keymap('n', '<leader><leader>', '<cmd>:Telescope<CR>', opts) -- telescope command pallette
keymap('n', '<leader>t', ':FloatermToggle<CR>', opts) -- open terminal
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', opts) -- normal mode within terminal window
keymap('n', '<leader>g', '<cmd>lua require("telescope.builtin").git_status()<CR>', opts) -- git status

-- # Buffers
keymap('n', '<leader>br', ':e<CR>', opts) -- reload buffer
keymap('n', '<leader>bs', ':setlocal spell! spelllang=en_gb,en_us<CR>', opts) -- toggle spellcheck
keymap('n', '<leader>bf', ':echo "FORMATTING NOT IMPLEMENTED YET!"', opts) -- format buffer
keymap('n', '<leader>/b', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', opts) -- grep buffer
keymap("v", "<", "<gv", opts) -- shift lines left
keymap("v", "J", ":m .+1<CR>==", opts) -- shift lines down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts) -- shift lines down
keymap("v", "K", ":m .-2<CR>==", opts) -- shift lines up
keymap("x", "K", ":move '<-2<CR>gv-gv", opts) -- shift lines up
keymap("v", ">", ">gv", opts) -- shift lines right
keymap("n", "]b", ":bnext<CR>", opts) -- next buffer
keymap("n", "[b", ":bprevious<CR>", opts) -- previous buffer

-- # Navigation
keymap('n', '-', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ cwd = require("telescope.utils").buffer_dir() })<CR>', opts) -- file browser (current directory)
keymap('n', '<leader>f', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts) -- find file
keymap('n', '<leader>/f', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts) -- grep files
keymap('n', ']q', ':cn<CR>', opts) -- next quick fix
keymap('n', '[q', ':cp<CR>', opts) -- previous quick fix

-- # Windows
keymap('n', '<leader>h', '<C-W>h', opts) -- cursor left
keymap('n', '<leader>j', '<C-W>j', opts) -- cursor down
keymap('n', '<leader>k', '<C-W>k', opts) -- cursor up
keymap('n', '<leader>l', '<C-W>l', opts) -- cursor right
keymap('n', '<leader>H', '<C-W>H', opts) -- window left
keymap('n', '<leader>J', '<C-W>J', opts) -- window down
keymap('n', '<leader>K', '<C-W>K', opts) -- window up
keymap('n', '<leader>L', '<C-W>L', opts) -- window right
keymap("n", "<leader><Left>", ":vertical resize -2<CR>", opts) -- decrease horizontal size
keymap("n", "<leader><Down>", ":resize -2<CR>", opts) -- decrease vertical size
keymap("n", "<leader><Up>", ":resize +2<CR>", opts) -- increase vertical size
keymap("n", "<leader><Right>", ":vertical resize +2<CR>", opts) -- increase horizontal size
keymap('n', '<leader>ww', ':w<CR>', opts) -- window buffer write
keymap('n', '<leader>wq', ':q<CR>', opts) -- window buffer quit
keymap('n', '<leader>wx', ':split<CR>', opts) -- split horizontal
keymap('n', '<leader>wv', ':vsplit<CR>', opts) -- split vertical
keymap('n', '<leader>wt', '<C-W>T', opts) -- window to tab
keymap('n', '<leader>we', '<C-W>=', opts) -- equalise buffer windows
keymap('n', '<leader>wo', '<C-W>o', opts) -- close other buffer windows
keymap('n', '<leader>wm', '<C-W>_<C-W>|', opts) -- maximise buffer window

-- # Interface
keymap('n', '<leader>il', ':set background=light<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>', opts) -- set theme to light
keymap('n', '<leader>id', ':set background=dark<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>', opts) -- set theme to dark
keymap('n', '<leader>in', ':set relativenumber!<CR>', opts) -- toggle relative line numbers
keymap('n', '<leader>ic', ':set list!<CR>', opts) -- toggle display unprintable chars

-- # LSP
-- config-lsp.lua

-- # DAP
-- config-dap.lua

-- # Completion
-- cmp.lua
