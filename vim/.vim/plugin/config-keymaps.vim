" # Keymaps
let mapleader="\<Space>"

" ## Normal Mode
" ### Global Binds
" #### Environment
" command pallette
nnoremap <Leader><CR> <cmd>:Commands<CR>
" open terminal
nnoremap <leader>t <cmd>:belowright terminal<CR>
" normal mode in terminal
tnoremap <Esc><Esc> <C-\><C-N>
" git status
nnoremap <leader>g <cmd>:!lazygit<CR>
" open markdown preview
nnoremap <leader>p <cmd>:!glow % -p<CR>

" #### Cursor Movement = `h` + `j` + `k` + `l`
" cursor left
nnoremap <leader>h <C-W>h
" cursor down
nnoremap <leader>j <C-W>j
" cursor up
nnoremap <leader>k <C-W>k
" cursor right
nnoremap <leader>l <C-W>l

" #### Window Movement = `H` + `J` + `K` + `L`
" window left
nnoremap <leader>H <C-W>H
" window down
nnoremap <leader>J <C-W>J
" window up
nnoremap <leader>K <C-W>K
" window right
nnoremap <leader>L <C-W>L

" #### Window Resize = `<Left>` + `<Down>` + `<Up>` + `<Right>`
" decrease horizontal size
nnoremap <leader><Left> <cmd>:vertical resize -2<CR>
" decrease vertical size
nnoremap <leader><Down> <cmd>:resize -2<CR>
" increase vertical size
nnoremap <leader><Up> <cmd>:resize +2<CR>
" increase horizontal size
nnoremap <leader><Right> <cmd>:vertical resize +2<CR>

" #### Next = `]`
" next buffer
nnoremap ]b <cmd>:bnext<CR>
" next diagnostic
nnoremap ]d <cmd>:ALENextWrap<CR>
" next quick fix
nnoremap ]q <cmd>:cn<CR>

" #### Previous = `[`
" previous buffer
nnoremap [b <cmd>:bprevious<CR>
" previous diagnostic
nnoremap [d <cmd>:ALEPreviousWrap<CR>
" previous quick fix
nnoremap [q <cmd>:cp<CR>

" ### Leader Groups
" #### Buffers = `b`
" write buffer
nnoremap <leader>bw <cmd>:w<CR>
" reload buffer
nnoremap <leader>br <cmd>:e<CR>
" quit buffer
nnoremap <leader>bq <cmd>:q<CR>
" split horizontal
nnoremap <leader>bx <cmd>:split<CR>
" split vertical
nnoremap <leader>bv <cmd>:vsplit<CR>
" equalise buffer windows
nnoremap <leader>be <C-W>=
" maximise buffer window
nnoremap <leader>bm <C-W>_<C-W>|
" close other buffer windows
nnoremap <leader>bo <C-W>o
" format buffer
nnoremap <leader>bf <cmd>:ALEFix<CR>
" toggle spellcheck
nnoremap <Leader>bs <cmd>:setlocal spell! spelllang=en_gb,en_us<CR>
" grep buffer
" nnoremap <Leader>b/ <cmd>:Ag<CR>

" #### Files = `f`
" find file
nnoremap <leader>ff <cmd>:CtrlP<CR>
" file browser (project directory)
nnoremap <leader>fb <cmd>:Explore<CR>
" file browser (current directory)
nnoremap <leader>fd <cmd>:Explore %:p:h<CR>
" grep files
" nnoremap <Leader>f/ <cmd>:Ag<CR>

" #### Code = `c`
" go to type declaration
nnoremap <leader>ct <cmd>:ALEGoToTypeDefinition<CR>
" go to definition
nnoremap <leader>cd <cmd>:ALEGoToDefinition<CR>
" go to implementation
nnoremap <leader>ci <cmd>:ALEGoToImplementation<CR>
" go to references
nnoremap <leader>cr <cmd>:ALEFindReferences<CR>
" show hover
nnoremap <leader>ch <cmd>:ALEHover<CR>
" rename symbol
nnoremap <leader>cn <cmd>:ALERename<CR>
" show code actions
nnoremap <leader>ca <cmd>:ALECodeAction<CR>
" open diagnostic quickfix list
nnoremap <leader>cq <cmd>:ALEPopulateQuickfix<CR>

" #### Interface = `i`
" set theme to light
nnoremap <leader>il <cmd>:set background=light<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>
" set theme to dark
nnoremap <leader>id <cmd>:set background=dark<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>
" toggle display unprintable chars
nnoremap <leader>ic <cmd>:set list!<CR>

" #### Shift = `s`
" shift lines left
nnoremap <leader>sh <<
" shift lines down
nnoremap <leader>sj <cmd>:m .+1<CR>==
" shift lines up
nnoremap <leader>sk <cmd>:m .-2<CR>==
" shift lines right
nnoremap <leader>sl >>

" ## Visual Mode
" ### Leader Binds
" #### Shift = `s`
" shift lines left
vnoremap <leader>sh <gv
" shift lines down
vnoremap <leader>sj <cmd>:m '>+1<CR>gv=gv
" shift lines up
vnoremap <leader>sk <cmd>:m '<-2<CR>gv=gv
" shift lines right
vnoremap <leader>sl >gv
