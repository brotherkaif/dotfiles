"       _
"__   _(_)_ __ ___  _ __ ___
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__
"  \_/ |_|_| |_| |_|_|  \___|
"============================

"XDG OVERRIDES
"set undodir=$XDG_DATA_HOME/vim/undo
"set directory=$XDG_DATA_HOME/vim/swap
"set backupdir=$XDG_DATA_HOME/vim/backup
"set viewdir=$XDG_DATA_HOME/vim/view
"set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
"set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

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
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'rhlobo/vim-super-retab'
	Plug 'sheerun/vim-polyglot'
	Plug 'jszakmeister/vim-togglecursor'
	Plug 'millermedeiros/vim-statline'
	Plug 'dylanaraps/wal.vim'
call plug#end()

"VIM CUSTOMISATION
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
