-- <leader> = space
vim.g.mapleader = " "

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

-- # NORMAL MODE
-- ## GLOBAL BINDS
-- ### LEADER BINDS
keymap('n', '<Leader><Esc>', '<cmd>:Telescope<CR>', opts) -- telescope command pallette
keymap('n', '<leader>t', ':term<CR>:startinsert<CR>', opts) -- open terminal
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', opts) -- normal mode within terminal window

-- ### CURSOR MOVEMENT = `h` + `j` + `k` + `l`
keymap('n', '<leader>h', '<C-W>h', opts) -- cursor left
keymap('n', '<leader>j', '<C-W>j', opts) -- cursor down
keymap('n', '<leader>k', '<C-W>k', opts) -- cursor up
keymap('n', '<leader>l', '<C-W>l', opts) -- cursor right

-- ### WINDOW MOVEMENT = `H` + `J` + `K` + `L`
keymap('n', '<leader>H', '<C-W>H', opts) -- window left
keymap('n', '<leader>J', '<C-W>J', opts) -- window down
keymap('n', '<leader>K', '<C-W>K', opts) -- window up
keymap('n', '<leader>L', '<C-W>L', opts) -- window right

-- ### WINDOW RESIZE = `<Left>` + `<Down>` + `<Up>` + `<Right>`
keymap("n", "<leader><Left>", ":vertical resize -2<CR>", opts) -- decrease horizontal size
keymap("n", "<leader><Down>", ":resize -2<CR>", opts) -- decrease vertical size
keymap("n", "<leader><Up>", ":resize +2<CR>", opts) -- increase vertical size
keymap("n", "<leader><Right>", ":vertical resize +2<CR>", opts) -- increase horizontal size

-- ### EASY MOTION
keymap("n", "<leader><leader>s", ":HopChar1<CR>", opts) -- search character
keymap("n", "<leader><leader>f", ":HopChar1AC<CR>", opts) -- find character forwards
keymap("n", "<leader><leader>F", ":HopChar1BC<CR>", opts) -- find character backwards
keymap("n", "<leader><leader>w", ":HopWordAC<CR>", opts) -- start of word forwards
keymap("n", "<leader><leader>b", ":HopWordBC<CR>", opts) -- start of word backwards
keymap("n", "<leader><leader>j", ":HopLineStartAC<CR>", opts) -- start of line forwards
keymap("n", "<leader><leader>k", ":HopLineStartBC<CR>", opts) -- start of line backwards
keymap("n", "<leader><leader>/", ":HopPattern<CR>", opts) -- search n-character

-- ## GROUPED BINDS
-- ### BUFFERS = `b`
keymap('n', '<leader>bw', ':w<CR>', opts) -- write buffer
keymap('n', '<leader>br', ':e<CR>', opts) -- reload buffer
keymap('n', '<Leader>bz', ':ZenMode<CR>', opts) -- toggle zen mode
keymap('n', '<leader>bm', '<C-W>_<C-W>|', opts) -- maximise buffer window
keymap('n', '<leader>bx', ':split<CR>', opts) -- split horizontal
keymap('n', '<leader>bv', ':vsplit<CR>', opts) -- split vertical
keymap('n', '<leader>be', '<C-W>=', opts) -- equalise buffer windows
keymap('n', '<leader>bq', ':q<CR>', opts) -- quit buffer
keymap('n', '<leader>bo', '<C-W>o', opts) -- close other buffer windows
keymap('n', '<leader>bf', ':Format<CR>', opts) -- format buffer
keymap('n', '<Leader>bs', ':setlocal spell! spelllang=en_gb,en_us<CR>', opts) -- toggle spellcheck
keymap('n', '<Leader>b/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', opts) -- grep buffer

-- ### FILES = `f`
keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts) -- find file
keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").git_files()<CR>', opts) -- find git file
keymap('n', '<leader>fb', '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>', opts) -- file browser (project directory)
keymap('n', '<leader>fd', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ cwd = require("telescope.utils").buffer_dir() })<CR>', opts) -- file browser (current directory)
keymap('n', '<Leader>f/', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts) -- grep files

-- ### GIT = `g`
keymap('n', '<leader>gs', '<cmd>lua require("telescope.builtin").git_status()<CR>', opts) -- git status
keymap('n', '<leader>gc', ':Git commit<CR>', opts) -- git commit

-- ### INTERFACE = `i`
keymap('n', '<leader>il', ':set background=light<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>', opts) -- set theme to light
keymap('n', '<leader>id', ':set background=dark<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>', opts) -- set theme to dark
keymap('n', '<leader>in', ':set relativenumber!<CR>', opts) -- toggle relative line numbers
keymap('n', '<leader>ic', ':set list!<CR>', opts) -- toggle display unprintable chars

-- ### NEXT = `n`
keymap("n", "<leader>nb", ":bnext<CR>", opts) -- next buffer
keymap('n', '<leader>nq', ':cn<CR>', opts) -- next quick fix

-- ### PREV = `p`
keymap("n", "<leader>pb", ":bprevious<CR>", opts) -- previous buffer
keymap('n', '<leader>pq', ':cp<CR>', opts) -- previous quick fix

-- # VISUAL MODE
-- ## GLOBAL BINDS
keymap("v", "J", ":m .+1<CR>==", opts) -- move lines down
keymap("v", "K", ":m .-2<CR>==", opts) -- move lines up
keymap("v", "<", "<gv", opts) -- persist unindent
keymap("v", ">", ">gv", opts) -- persist indent
-- keymap("v", "p", '"_dP', opts) -- fix HORRIBLE paste behaviour

-- # VISUAL BLOCK MODE
-- ## GLOBAL BINDS
keymap("x", "J", ":move '>+1<CR>gv-gv", opts) -- move lines down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts) -- move lines up
