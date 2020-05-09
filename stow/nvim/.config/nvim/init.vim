" _       _ _         _
"(_)_ __ (_) |___   _(_)_ __ ___
"| | '_ \| | __\ \ / / | '_ ` _ \
"| | | | | | |_ \ V /| | | | | | |
"|_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"=================================

"VIM-PLUG AUTO-LOAD
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"PLUG-IN LIST
call plug#begin()
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-commentary'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'rhlobo/vim-super-retab'
	Plug 'sheerun/vim-polyglot'
	Plug 'scrooloose/vim-statline'
	Plug 'arcticicestudio/nord-vim'
	Plug 'dylanaraps/wal.vim'
call plug#end()

"VIM CUSTOMISATION
"line numbers
set number
set relativenumber

"interface
set showmatch
colorscheme wal
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

"indentation behaviour
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
