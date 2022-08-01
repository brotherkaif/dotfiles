# dotfiles
The dotfiles of Brother Kaif.

## Setup
The `bootstrap.sh` script can be run to setup a basic development environment. The scripts within the `scripts` directory can be run individually if only specific setup needs to occur.

## Keymaps
### Tools
| Mode     | Mapping            | Effect                      |
|----------|--------------------|-----------------------------|
| normal   | `<Leader><Leader>` | Open Command Palette        |
| normal   | `<leader>t`        | Open terminal               |
| terminal | `<Esc><Esc>`       | Normal mode within terminal |
| normal   | `<leader>g`        | git status                  |

### Buffers
| Mode   | Mapping      | Effect            |
|--------|--------------|-------------------|
| normal | `<leader>br` | reload buffer     |
| normal | `<Leader>bs` | toggle spellcheck |
| normal | `<Leader>bf` | format buffer     |
| normal | `<Leader>/b` | grep buffer       |
| visual | `<`          | shift lines left  |
| visual | `J`          | shift lines down  |
| visual | `K`          | shift lines up    |
| visual | `>`          | shift lines right |
| normal | `]b`         | next buffer       |
| normal | `[b`         | previous buffer   |

### Navigation
| Mode   | Mapping      | Effect                           |
|--------|--------------|----------------------------------|
| normal | `-`          | file browser (current directory) |
| normal | `<leader>f`  | find file                        |
| normal | `<Leader>/f` | grep files                       |
| normal | `]q`         | next quick fix                   |
| normal | `[q`         | previous quick fix               |

### LSP
| Mode   | Mapping     | Effect                  |
|--------|-------------|-------------------------|
| normal | `gD`        | go to declaration       |
| normal | `gd`        | go to definition        |
| normal | `K`         | cursor hover            |
| normal | `gi`        | go to implementation    |
| normal | `<C-k>`     | signature help          |
| normal | `<space>wa` | add workspace folder    |
| normal | `<space>wr` | remove workspace folder |
| normal | `<space>wl` | list workspace folders  |
| normal | `<space>D`  | go to type definition   |
| normal | `<space>rn` | rename                  |
| normal | `<space>ca` | code action             |
| normal | `gr`        | go to references        |

### DAP
| Mode   | Mapping        | Effect            |
|--------|----------------|-------------------|
| normal | `<F9>`         | toggle breakpoint |
| normal | `<F5>`         | start/continue    |
| normal | `<Shift><F5>`  | stop              |
| normal | `<F11>`        | step into         |
| normal | `<Shift><F11>` | step out          |
| normal | `<F10>`        | step over         |

### Completion
| Mode   | Mapping     | Effect               |
|--------|-------------|----------------------|
| insert | `<C-n>`     | select next item     |
| insert | `<C-p>`     | select previous item |
| insert | `<C-y>`     | accept suggestion    |
| insert | `<C-e>`     | dismiss suggestion   |
| insert | `<C-k>`     | expand/jump snippet  |
| insert | `<C-f>`     | scroll docs down     |
| insert | `<C-d>`     | scroll docs up       |
| insert | `<C-Space>` | complete suggestion  |

### Copilot
| Mode   | Mapping | Effect                   |
|--------|---------|--------------------------|
| insert | `<C-h>` | show previous suggestion |
| insert | `<C-j>` | accept suggestion        |
| insert | `<C-k>` | dismiss suggestion       |
| insert | `<C-l>` | show next suggestion     |

### Windows
| Mode   | Mapping           | Effect                     |
|--------|-------------------|----------------------------|
| normal | `<leader>h`       | cursor left                |
| normal | `<leader>j`       | cursor down                |
| normal | `<leader>k`       | cursor up                  |
| normal | `<leader>l`       | cursor right               |
| normal | `<leader>H`       | window left                |
| normal | `<leader>J`       | window down                |
| normal | `<leader>K`       | window up                  |
| normal | `<leader>L`       | window right               |
| normal | `<leader><Left>`  | decrease horizontal size   |
| normal | `<leader><Down>`  | decrease vertical size     |
| normal | `<leader><Up>`    | increase vertical size     |
| normal | `<leader><Right>` | increase horizontal size   |
| normal | `<leader>ww`      | window buffer write        |
| normal | `<leader>wq`      | window buffer quit         |
| normal | `<leader>wx`      | split horizontal           |
| normal | `<leader>wv`      | split vertical             |
| normal | `<leader>wt`      | window to tab              |
| normal | `<leader>we`      | equalise buffer windows    |
| normal | `<leader>wo`      | close other buffer windows |
| normal | `<leader>wm`      | maximise buffer window     |

### Interface
| Mode   | Mapping      | Effect                           |
|--------|--------------|----------------------------------|
| normal | `<leader>il` | set theme to light               |
| normal | `<leader>id` | set theme to dark                |
| normal | `<leader>in` | toggle relative line numbers     |
| normal | `<leader>ic` | toggle display unprintable chars |
