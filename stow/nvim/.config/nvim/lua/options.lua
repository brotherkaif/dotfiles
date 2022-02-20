local options = vim.o
local window_options = vim.wo
local buffer_options = vim.bo
local command = vim.cmd

-- <leader> = space
vim.g.mapleader = " "

-- disable annoying stuff
options.errorbells = false
command('set clipboard+=unnamedplus')

-- disable backup and swp files
buffer_options.swapfile = false
options.backup = false

-- line numbers
window_options.number = true
options.scrolloff = 8

-- display
options.completeopt = 'menu,menuone,noselect'
window_options.wrap = false
window_options.signcolumn = 'yes'
command('highlight clear SignColumn')
command('highlight clear Folded')
command('highlight VertSplit cterm=NONE gui=NONE')
command('highlight Pmenu ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey')
command('highlight PmenuSel ctermbg=Grey guibg=Grey ctermfg=Black guifg=Black')
command('highlight PmenuSbar ctermbg=Black guibg=Black')
command('highlight PmenuThumb ctermbg=Grey guibg=Grey')
command('highlight Twilight ctermfg=8')
command('highlight LspDiagnosticsFloating ctermbg=Black guibg=Black')

-- searching
options.ignorecase = true
options.smartcase = true
options.hlsearch = false

-- interface
options.showmatch = true
window_options.cursorline = true
window_options.list = true
command('let g:netrw_liststyle = 3')
command('let g:netrw_menu = 0')
command('let g:netrw_hide = 0')
command('set listchars=tab:‹·›,trail:·,lead:·,precedes:«,extends:»')
command('highlight SpecialKey ctermfg=DarkGrey guifg=DarkGrey')
command('highlight NonText ctermfg=DarkGrey guifg=DarkGrey')

-- split behaviour
options.splitbelow = true
options.splitright = true

-- indentation behaviour
buffer_options.expandtab = false
buffer_options.smartindent = true
buffer_options.softtabstop = 0
buffer_options.tabstop = 2
options.shiftwidth = 2
window_options.foldmethod = 'indent'
options.foldlevel = 2

-- lsp
command('highlight LspDiagnosticsVirtualTextError ctermfg=Red guifg=Red')
command('highlight LspDiagnosticsVirtualTextWarning ctermfg=Yellow guifg=Yellow')
command('highlight LspDiagnosticsVirtualTextHint ctermfg=Blue guifg=Blue')
command('highlight LspDiagnosticsVirtualTextInformation ctermfg=DarkGrey guifg=DarkGrey')
command('highlight LspDiagnosticsUnderlineError ctermfg=none guifg=none cterm=underline gui=underline')
command('highlight LspDiagnosticsUnderlineWarning ctermfg=none guifg=none cterm=underline gui=underline')
command('highlight LspDiagnosticsUnderlineInformation ctermfg=none guifg=none cterm=underline gui=underline')
command('highlight LspDiagnosticsUnderlineHint ctermfg=none guifg=none cterm=underline gui=underline')

if debug_mode==true then
  print('- options.lua...OK!')
end
