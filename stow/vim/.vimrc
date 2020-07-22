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
" let g:coc_global_extensions = [
" 	\ 'coc-tsserver',
" 	\ 'coc-prettier',
" 	\ 'coc-git',
" 	\ 'coc-yaml',
" 	\ 'coc-tsserver',
" 	\ 'coc-json'
" 	\ ]

"ale
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_fixers = {
	\    'javascript': ['eslint'],
	\    'typescriptreact': ['eslint'],
	\    'typescript': ['eslint'],
	\    'json': ['eslint'],
	\}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_completion_enabled=1
set omnifunc=ale#completion#OmniFunc

"PLUG-IN LIST
call plug#begin('$XDG_DATA_HOME/vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'dense-analysis/ale'
	Plug 'rhlobo/vim-super-retab'
	Plug 'sheerun/vim-polyglot'
	Plug 'jszakmeister/vim-togglecursor'
	Plug 'itchyny/lightline.vim'
	Plug 'morhetz/gruvbox'
	" Plug 'arcticicestudio/nord-vim'
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
set noshowmode

"column
" set colorcolumn=80

"colorscheme
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
let g:lightline = {
     \ 'colorscheme': 'gruvbox',
     \ }

" colorscheme nord
" let g:lightline = {
"       \ 'colorscheme': 'nord',
"       \ }

"force cursor underline
set cursorline
" hi clear CursorLine
" hi CursorLine gui=underline cterm=underline

" au VimEnter * highlight clear SignColumn
" set ruler

"searching
set incsearch
set hlsearch
set showmatch

"indentation behaviour
set noexpandtab
" set copyindent
" set preserveindent
set smartindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

"KEYBINDINGS 
let mapleader = "\<Space>"
nnoremap <leader>se :Sexplore<CR>
nnoremap <leader>ve :Vexplore<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>st :term<CR>
nnoremap <leader>vt :vert term<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>t :GFiles<CR>
nnoremap <Leader>p :Commands<CR>
nnoremap <Leader>/ :Ag<CR>
nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>sd :ALEGoToDefinitionInSplit<CR>
nnoremap <Leader>vd :ALEGoToDefinitionInVSplit<CR>
