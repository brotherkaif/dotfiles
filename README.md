# dotfiles
The dotfiles of Brother Kaif.

## Setup
The `bootstrap.sh` script can be run to setup a basic development environment. The scripts within the `scripts` directory can be run individually if only specific setup needs to occur.

## Keymaps
### General
| Mode     | Mapping           | Effect                           |
|----------|-------------------|----------------------------------|
| normal   | '<Leader><CR>'    | Open Command Palette             |
| normal   | '<leader>t'       | Open terminal                    |
| terminal | '<Esc><Esc>'      | Normal mode within terminal      |
| normal   | '<leader>h'       | cursor left                      |
| normal   | '<leader>j'       | cursor down                      |
| normal   | '<leader>k'       | cursor up                        |
| normal   | '<leader>l'       | cursor right                     |
| normal   | '<leader>H'       | window left                      |
| normal   | '<leader>J'       | window down                      |
| normal   | '<leader>K'       | window up                        |
| normal   | '<leader>L'       | window right                     |
| normal   | "<leader><Left>"  | decrease horizontal size         |
| normal   | "<leader><Down>"  | decrease vertical size           |
| normal   | "<leader><Up>"    | increase vertical size           |
| normal   | "<leader><Right>" | increase horizontal size         |
| normal   | '<leader>bw'      | write buffer                     |
| normal   | '<leader>br'      | reload buffer                    |
| normal   | '<Leader>bz'      | toggle zen mode                  |
| normal   | '<leader>bm'      | maximise buffer window           |
| normal   | '<leader>bx'      | split horizontal                 |
| normal   | '<leader>bv'      | split vertical                   |
| normal   | '<leader>be'      | equalise buffer windows          |
| normal   | '<leader>bo'      | close other buffer windows       |
| normal   | '<Leader>bs'      | toggle spellcheck                |
| normal   | '<Leader>/b'      | grep buffer                      |
| normal   | '<leader>p'       | find file                        |
| normal   | '-'               | file browser (current directory) |
| normal   | '<Leader>/p'      | grep files                       |
| normal   | '<leader>g'       | git status                       |
| normal   | '<leader>il'      | set theme to light               |
| normal   | '<leader>id'      | set theme to dark                |
| normal   | '<leader>in'      | toggle relative line numbers     |
| normal   | '<leader>ic'      | toggle display unprintable chars |
| normal   | "]b"              | next buffer                      |
| normal   | ']q'              | next quick fix                   |
| normal   | "[b"              | previous buffer                  |
| normal   | '[q'              | previous quick fix               |

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
