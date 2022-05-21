" # Keymaps
let mapleader="\<Space>"

" ## Normal Mode
" ### Global Binds
" #### Environment
" command pallette
nnoremap <Leader><CR> <cmd>:Commands<CR>
" open terminal
nnoremap <leader>t :belowright terminal<CR>
" normal mode in terminal
tnoremap <Esc><Esc> <C-\><C-N>
" git status
nnoremap <leader>g :Git<CR>

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
nnoremap <leader><Left> :vertical resize -2<CR>
" decrease vertical size
nnoremap <leader><Down> :resize -2<CR>
" increase vertical size
nnoremap <leader><Up> :resize +2<CR>
" increase horizontal size
nnoremap <leader><Right> :vertical resize +2<CR>

" #### Next = `]`
" next buffer
nnoremap ]b :bnext<CR>
" next diagnostic
nnoremap ]d :ALENextWrap<CR>
" next quick fix 
nnoremap ]q :cn<CR>

" #### Previous = `[`
" previous buffer
nnoremap [b :bprevious<CR>
" previous diagnostic
nnoremap [d :ALEPreviousWrap<CR>
" previous quick fix
nnoremap [q :cp<CR>

" ### Leader Groups
" #### Buffers = `b`
" write buffer
nnoremap <leader>bw :w<CR>
" reload buffer
nnoremap <leader>br :e<CR>
" quit buffer
nnoremap <leader>bq :q<CR>
" split horizontal
nnoremap <leader>bx :split<CR>
" split vertical
nnoremap <leader>bv :vsplit<CR>
" equalise buffer windows
nnoremap <leader>be <C-W>=
" maximise buffer window
nnoremap <leader>bm <C-W>_<C-W>|
" close other buffer windows
nnoremap <leader>bo <C-W>o
" format buffer
nnoremap <leader>bf :Format<CR>
" toggle spellcheck
nnoremap <Leader>bs :setlocal spell! spelllang=en_gb,en_us<CR>
" grep buffer
nnoremap <Leader>b/ :Ag<CR>

" #### Files = `f`
" find file
nnoremap <leader>ff :Files<CR>
" find git file
nnoremap <leader>fg :GFiles<CR>
" file browser (project directory)
nnoremap <leader>fb :Lexplore<CR>
" file browser (current directory)
nnoremap <leader>fd :Lexplore %:p:h<CR>
" grep files
nnoremap <Leader>f/ :Ag<CR>

" #### Code = `c`
" go to type declaration
nnoremap <leader>ct :ALEGoToTypeDefinition<CR>
" go to definition
nnoremap <leader>cd :ALEGoToDefinition<CR>
" go to implementation
nnoremap <leader>ci :ALEGoToImplementation<CR>
" go to references
nnoremap <leader>cr :ALEFindReferences<CR>
" show hover
nnoremap <leader>ch :ALEHover<CR>
" rename symbol
nnoremap <leader>cn :ALERename<CR>
" show code actions
nnoremap <leader>ca :ALECodeAction<CR>
" open diagnostic quickfix list
nnoremap <leader>cq :ALEPopulateQuickfix<CR>

" #### Interface = `i`
" set theme to light
nnoremap <leader>il :set background=light<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>
" set theme to dark
nnoremap <leader>id :set background=dark<CR>:highlight clear SignColumn<CR>:highlight clear Folded<CR>
" toggle display unprintable chars
nnoremap <leader>ic :set list!<CR>

" #### Shift = `s`
" shift lines left
nnoremap <leader>sh <<
" shift lines down
nnoremap <leader>sj :m .+1<CR>==
" shift lines up
nnoremap <leader>sk :m .-2<CR>==
" shift lines right
nnoremap <leader>sl >>

" ## Visual Mode
" ### Leader Binds
" #### Shift = `s`
" shift lines left
vnoremap <leader>sh <gv
" shift lines down
vnoremap <leader>sj :m '>+1<CR>gv=gv
" shift lines up
vnoremap <leader>sk :m '<-2<CR>gv=gv
" shift lines right
vnoremap <leader>sl >gv
