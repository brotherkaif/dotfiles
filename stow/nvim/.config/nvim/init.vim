" _       _ _         _
"(_)_ __ (_) |___   _(_)_ __ ___
"| | '_ \| | __\ \ / / | '_ ` _ \
"| | | | | | |_ \ V /| | | | | | |
"|_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"=================================

"LINTING AND LSP PRE-CONFIG
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_completion_enabled = 1

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
	Plug 'junegunn/goyo.vim'
	Plug 'dense-analysis/ale'
	Plug 'mhinz/vim-signify'
	Plug 'rhlobo/vim-super-retab'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'millermedeiros/vim-statline'
	Plug 'pangloss/vim-javascript'
	Plug 'dylanaraps/wal.vim'
call plug#end()

"PLUG-IN CONFIG: ALE
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1

"PLUG-IN CONFIG: vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0

" Mapping
let g:multi_cursor_start_word_key      = 'gb'
let g:multi_cursor_select_all_word_key = 'gB'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = 'gb'
let g:multi_cursor_prev_key            = 'gv'
" let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"VIM CUSTOMISATION
"line numbers
set number
set relativenumber

"interface
set showmatch
set cursorline
au VimEnter * highlight clear SignColumn
au VimEnter * highlight clear CursorLine
au VimEnter * highlight CursorLine gui=underline cterm=underline
colorscheme wal

"indentation behaviour
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
