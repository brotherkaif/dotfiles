"       _
"__   _(_)_ __ ___  _ __ ___
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__
"  \_/ |_|_| |_| |_|_|  \___|
"============================
"VIM-PLUG AUTO-LOAD
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"PLUG-IN CONFIG
"coc.nvim
let g:coc_global_extensions = ['coc-snippets', 'coc-git', 'coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier']

"ultisnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"PLUG-IN LIST
call plug#begin('$XDG_DATA_HOME/vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'sheerun/vim-polyglot'
	Plug 'rhlobo/vim-super-retab'
	Plug 'millermedeiros/vim-statline'
	Plug 'jszakmeister/vim-togglecursor'
call plug#end()

"VIM CUSTOMISATION
"disable annoying stuff
set noerrorbells

"disable backup and swp files
set noswapfile
set nobackup

"undo configuration
set undodir=$HOME/.vim/undodir

"line numbers
set number
set relativenumber

"display
syntax enable
set nowrap
highlight Pmenu ctermfg=white ctermbg=black guibg=black

"force cursor underline
set cursorline

"searching
set incsearch
set hlsearch
set showmatch

"indentation behaviour
set noexpandtab
set smartindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

"KEYBINDINGS 
let mapleader = "\<Space>"
"explore
nnoremap <leader>e :tabnew<CR>:Explore<CR>
nnoremap <leader>se :Sexplore<CR>
nnoremap <leader>ve :Vexplore<CR>
"terminal
nnoremap <leader>t :tabnew<CR>:term<CR><C-W>N:wincmd j<CR>:q<CR><insert>
nnoremap <leader>st :term<CR>
nnoremap <leader>vt :vert term<CR>
"terminal pane normal mode
tnoremap <Esc> <C-W>N
"navigate panes
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
"git status
nnoremap <leader>g :G<CR>
"target file
nnoremap <leader>f :GFiles<CR>
"command palatte
nnoremap <Leader>p :Commands<CR>
"search files
nnoremap <Leader>/ :Ag<CR>
"snippets library
nnoremap <Leader>s :Snippets<CR>
"correct errors
nnoremap <leader>c :CocCommand eslint.executeAutofix<CR>
"go to definition
nnoremap <Leader>d :ALEGoToDefinition -tab<CR>
nnoremap <Leader>sd :ALEGoToDefinition -split<CR>
nnoremap <Leader>vd :ALEGoToDefinition -vsplit<CR>
