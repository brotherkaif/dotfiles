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

"PLUG-IN LIST
call plug#begin('$XDG_DATA_HOME/vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'dense-analysis/ale'
	Plug 'rhlobo/vim-super-retab'
	Plug 'sheerun/vim-polyglot'
	Plug 'jszakmeister/vim-togglecursor'
	Plug 'millermedeiros/vim-statline'
	Plug 'dylanaraps/wal.vim'
call plug#end()

"PLUG-IN CONFIG
"ale
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_fixers = {
	\    'javascript': ['eslint'],
	\    'typescriptreact': ['eslint'],
	\    'typescript': ['eslint'],
	\    'json': ['eslint'],
	\}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_completion_enabled = 1

"VIM CUSTOMISATION
"disable backup and swp files
set nobackup
set noswapfile

"line numbers
set number
set relativenumber

"interface
syntax enable
colorscheme wal
set showmatch
" set ruler
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
" au VimEnter * highlight clear SignColumn

"searching
set incsearch
set hlsearch

"indentation behaviour
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
