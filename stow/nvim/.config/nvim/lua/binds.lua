-- <leader> = space
vim.g.mapleader = " "

local opts = {noremap = true, silent = true}

-- # GLOBAL BINDS
vim.api.nvim_set_keymap('n', '[q', ':cp<CR>', opts) -- previous quick fix
vim.api.nvim_set_keymap('n', ']q', ':cn<CR>', opts) -- next quick fix

-- # LEADER BINDS
vim.api.nvim_set_keymap('n', '<Leader>p', '<cmd>lua require("telescope.builtin").commands()<CR>', opts) -- command pallette
vim.api.nvim_set_keymap('n', '<leader>t', ':term<CR>:startinsert<CR>', opts) -- open terminal
vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', opts) -- normal mode within terminal window

-- CURSOR MOVEMENT = `h` + `j` + `k` + `l`
vim.api.nvim_set_keymap('n', '<leader>h', ':FocusSplitLeft<CR>', opts) -- cursor left
vim.api.nvim_set_keymap('n', '<leader>j', ':FocusSplitDown<CR>', opts) -- cursor down
vim.api.nvim_set_keymap('n', '<leader>k', ':FocusSplitUp<CR>', opts) -- cursor up
vim.api.nvim_set_keymap('n', '<leader>l', ':FocusSplitRight<CR>', opts) -- cursor right

-- WINDOW MOVEMENT = `H` + `J` + `K` + `L`
vim.api.nvim_set_keymap('n', '<leader>H', '<C-W>H', opts) -- window left
vim.api.nvim_set_keymap('n', '<leader>J', '<C-W>J', opts) -- window down
vim.api.nvim_set_keymap('n', '<leader>K', '<C-W>K', opts) -- window up
vim.api.nvim_set_keymap('n', '<leader>L', '<C-W>L', opts) -- window right

-- # GROUPED BINDS
-- BUFFERS = `b`
vim.api.nvim_set_keymap('n', '<leader>bw', ':w<CR>', opts) -- write buffer
vim.api.nvim_set_keymap('n', '<leader>br', ':e<CR>', opts) -- reload buffer
vim.api.nvim_set_keymap('n', '<Leader>bz', ':ZenMode<CR>', opts) -- toggle zen mode
vim.api.nvim_set_keymap('n', '<leader>bm', '<C-W>_<C-W>|', opts) -- maximise buffer window
vim.api.nvim_set_keymap('n', '<leader>be', '<C-W>=', opts) -- equalise buffer windows
vim.api.nvim_set_keymap('n', '<leader>bq', ':q<CR>', opts) -- quit buffer
vim.api.nvim_set_keymap('n', '<leader>bo', '<C-W>o', opts) -- close other buffer windows
vim.api.nvim_set_keymap('n', '<leader>bf', ':Format<CR>', opts) -- format buffer
vim.api.nvim_set_keymap('n', '<Leader>bs', ':setlocal spell! spelllang=en_gb,en_us<CR>', opts) -- toggle spellcheck
vim.api.nvim_set_keymap('n', '<Leader>b/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', opts) -- grep buffer

-- FILES = `f`
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts) -- find file
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").git_files()<CR>', opts) -- find git file
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>', opts) -- file browser (project directory)
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ cwd = require("telescope.utils").buffer_dir() })<CR>', opts) -- file browser (current directory)
vim.api.nvim_set_keymap('n', '<Leader>f/', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts) -- grep files

-- GIT = `g`
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>lua require("telescope.builtin").git_status()<CR>', opts) -- git status
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', opts) -- git commit

-- INTERFACE = `i`
vim.api.nvim_set_keymap('n', '<leader>il', ':set background=light<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>', opts) -- set theme to light
vim.api.nvim_set_keymap('n', '<leader>id', ':set background=dark<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>', opts) -- set theme to dark
vim.api.nvim_set_keymap('n', '<leader>in', ':set relativenumber!<CR>', opts) -- toggle relative line numbers
vim.api.nvim_set_keymap('n', '<leader>ic', ':set list!<CR>', opts) -- toggle display unprintable chars

if debug_mode==true then
  print('- binds.lua...OK!')
end
