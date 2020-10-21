" _       _ _         _
"(_)_ __ (_) |___   _(_)_ __ ___
"| | '_ \| | __\ \ / / | '_ ` _ \
"| | | | | | |_ \ V /| | | | | | |
"|_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"=================================
" VIM-PLUG AUTO-LOAD
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUG-IN CONFIG
" coc.nvim
" let g:coc_global_extensions = ['coc-snippets', 'coc-git', 'coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier']

" ultisnips
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" goyo/limelight
let g:limelight_conceal_ctermfg = 'DarkGray'
let g:limelight_conceal_guifg = 'DarkGray'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" PLUG-IN LIST
call plug#begin()
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Plug 'SirVer/ultisnips'
	" Plug 'honza/vim-snippets'
	Plug 'sheerun/vim-polyglot'
	Plug 'rhlobo/vim-super-retab'
	Plug 'millermedeiros/vim-statline'
	" Plug 'jszakmeister/vim-togglecursor'
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/limelight.vim'
call plug#end()

" LSP CONFIG
lua require("lsp_config")

" Javascipt/TypeScript

" VIM CUSTOMISATION
" disable annoying stuff
set noerrorbells

" disable backup and swp files
set noswapfile
set nobackup

" line numbers
set number
set relativenumber

" display
set background=light
" colorscheme desert
" syntax enable
" set nowrap
" highlight Pmenu ctermfg=white ctermbg=black guibg=black

" interface
set showmatch
set cursorline

" indentation behaviour
set noexpandtab
set smartindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

" KEYBINDINGS 
let mapleader = "\<Space>"
" explore
nnoremap <leader>ne :tabnew<CR>:Explore<CR>
nnoremap <leader>se :Sexplore<CR>
nnoremap <leader>ve :Vexplore<CR>
" terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>nt :tabnew<CR>:term<CR>
nnoremap <leader>st :split<CR>:term<CR>
nnoremap <leader>vt :vsplit<CR>:term<CR>
" git branch status
nnoremap <leader>b :G<CR>
"command palatte
nnoremap <Leader>P :Commands<CR>
" search files
nnoremap <Leader>/ :Ag<CR>
" correct errors
nnoremap <leader>c :CocCommand eslint.executeAutofix<CR>
" navigation
nnoremap <leader>p :Files<CR>
nnoremap <leader>t :GFiles<CR>
" nmap <silent> <leader>gd <Plug>(coc-definition)
" nmap <silent> <leader>gt <Plug>(coc-type-definition)
" nmap <silent> <leader>gi <Plug>(coc-implementation)
" nmap <silent> <leader>gr <Plug>(coc-references)
" non-flush paste
vnoremap <leader>p "_dP
