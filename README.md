# dotfiles
The dotfiles of Brother Kaif.

## Setup
The `bootstrap.sh` script can be run to setup a basic development environment. The scripts within the `scripts` directory can be run individually if only specific setup needs to occur.

## Keymaps
### General
| Mode     | Mapping           | Effect                           | Neovim                | VSCode                                      |
|----------|-------------------|----------------------------------|-----------------------|---------------------------------------------|
| normal   | '<Leader><CR>'    | Open Command Palette             | '<cmd>:Telescope<CR>' | "workbench.action.showCommands"             |
| normal   | '<leader>t'       | Open terminal                    | ':term<CR>'           | "workbench.action.createTerminalEditorSide" |
| terminal | '<Esc><Esc>'      | Normal mode within terminal      | '<C-\\><C-n>'         | n/a                                         |
| normal   | '<leader>h'       | cursor left                      | '<C-W>h' | |
| normal   | '<leader>j'       | cursor down                      | '<C-W>j' | |
| normal   | '<leader>k'       | cursor up                        | '<C-W>k' | |
| normal   | '<leader>l'       | cursor right                     | '<C-W>l' | |
| normal   | '<leader>H'       | window left                      | '<C-W>H' | |
| normal   | '<leader>J'       | window down                      | '<C-W>J' | |
| normal   | '<leader>K'       | window up                        | '<C-W>K' | |
| normal   | '<leader>L'       | window right                     | '<C-W>L' | |
| normal   | "<leader><Left>"  | decrease horizontal size         | ":vertical resize -2<CR>" | |
| normal   | "<leader><Down>"  | decrease vertical size           | ":resize -2<CR>" | |
| normal   | "<leader><Up>"    | increase vertical size           | ":resize +2<CR>" | |
| normal   | "<leader><Right>" | increase horizontal size         | ":vertical resize +2<CR>" | |
| normal   | '<leader>bw'      | write buffer                     | ':w<CR>' | |
| normal   | '<leader>br'      | reload buffer                    | ':e<CR>' | |
| normal   | '<Leader>bz'      | toggle zen mode                  | ':ZenMode<CR>' | |
| normal   | '<leader>bm'      | maximise buffer window           | '<C-W>_<C-W>|' | |
| normal   | '<leader>bx'      | split horizontal                 | ':split<CR>' | |
| normal   | '<leader>bv'      | split vertical                   | ':vsplit<CR>' | |
| normal   | '<leader>be'      | equalise buffer windows          | '<C-W>=' | |
| normal   | '<leader>bo'      | close other buffer windows       | '<C-W>o' | |
| normal   | '<Leader>bs'      | toggle spellcheck                | ':setlocal spell! spelllang=en_gb | |
| normal   | '<Leader>/b'      | grep buffer                      | '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>' | |
| normal   | '<leader>p'       | find file                        | '<cmd>lua require("telescope.builtin").find_files()<CR>' | |
| normal   | '-'               | file browser (current directory) | '<cmd>lua require("telescope").extensions.file_browser.file_browser({ cwd = require("telescope.utils").buffer_dir() })<CR>' | |
| normal   | '<Leader>/p'      | grep files                       | '<cmd>lua require("telescope.builtin").live_grep()<CR>' | |
| normal   | '<leader>g'       | git status                       | '<cmd>lua require("telescope.builtin").git_status()<CR>' | |
| normal   | '<leader>il'      | set theme to light               | ':set background=light<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>' | |
| normal   | '<leader>id'      | set theme to dark                | ':set background=dark<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>' | |
| normal   | '<leader>in'      | toggle relative line numbers     | ':set relativenumber!<CR>' | |
| normal   | '<leader>ic'      | toggle display unprintable chars | ':set list!<CR>' | |
| normal   | "]b"              | next buffer                      | ":bnext<CR>" | |
| normal   | ']q'              | next quick fix                   | ':cn<CR>' | |
| normal   | "[b"              | previous buffer                  | ":bprevious<CR>" | |
| normal   | '[q'              | previous quick fix               | ':cp<CR>' | |

### LSP
| Mode     | Mapping     | Effect                  |
|----------|-------------|-------------------------|
| normal   | 'gD'        | go to declaration       |
| normal   | 'gd'        | go to definition        |
| normal   | 'K'         | cursor hover            |
| normal   | 'gi'        | go to implementation    |
| normal   | '<C-k>'     | signature help          |
| normal   | '<space>wa' | add workspace folder    |
| normal   | '<space>wr' | remove workspace folder |
| normal   | '<space>wl' | list workspace folders  |
| normal   | '<space>D'  | go to type definition   |
| normal   | '<space>rn' | rename                  |
| normal   | '<space>ca' | code action             |
| normal   | 'gr'        | go to references        |
| normal   | '<space>f'  | format                  |

-- # VISUAL MODE
-- ## GLOBAL BINDS
-- keymap("v", "p", '"_dP', opts) -- fix HORRIBLE paste behaviour
keymap("v", "J", ":m .+1<CR>==", opts) -- move lines down
keymap("v", "K", ":m .-2<CR>==", opts) -- move lines up
keymap("v", "<", "<gv", opts) -- persist unindent
keymap("v", ">", ">gv", opts) -- persist indent

-- # VISUAL BLOCK MODE
-- ## GLOBAL BINDS
keymap("x", "J", ":move '>+1<CR>gv-gv", opts) -- move lines down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts) -- move lines up
