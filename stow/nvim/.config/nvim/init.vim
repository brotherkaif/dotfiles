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
	Plug 'arcticicestudio/nord-vim'
 	Plug 'itchyny/lightline.vim'
	" Plug 'terryma/vim-multiple-cursors'
call plug#end()

"PLUG-IN CONFIG: lightline
let g:lightline = {
\ 'colorscheme': 'nord',
\ }

"PLUG-IN CONFIG: vim-multiple-cursors
" let g:multi_cursor_use_default_mapping=0

" Mapping
" let g:multi_cursor_start_word_key      = 'gb'
" let g:multi_cursor_select_all_word_key = 'gv'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = 'gb'
" let g:multi_cursor_prev_key            = 'gB'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'

"VIM CUSTOMISATION
"line numbers
set number
set relativenumber

"interface
set showmatch
set cursorline
colorscheme nord

"indentation behaviour
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
