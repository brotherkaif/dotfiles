local options = {
	-- set highlight on search
	hlsearch = false,

	-- enable mouse mode
	mouse = 'a',

	-- enable break indent
	breakindent = true,

	-- case insensitive searching UNLESS /C or capital in search
	ignorecase = true,
	smartcase = true,

	-- faster completion (4000ms default)
	updatetime = 250,

	-- set colorscheme
	termguicolors = true,

	-- set completeopt to have a better completion experience
	completeopt = 'menuone,noselect',

	-- creates a backup file
	backup = false,

	-- so that `` is visible in markdown files
	conceallevel = 0,

	-- highlight the current line
	cursorline = true,

	-- disable terminal error bell
	errorbells = false,

	-- the encoding written to a file
	fileencoding = 'utf-8',

	-- the font used in graphical neovim applications
	guifont = 'Noto Sans Mono:h12',

	-- pop up menu height
	pumheight = 10,

	-- set relative numbered lines
	-- relativenumber = true,

	-- offset vertical scrolling
	scrolloff = 8,

	-- highlight matches on search pattern in real time
	showmatch = true,

	-- we don't need to see things like -- INSERT -- anymore
	-- showmode = false,

	-- always show tabs
	-- showtabline = 2,

	-- offset horizontal scrolling
	sidescrolloff = 8,

	-- make indenting smarter again
	-- smartindent = true,

	-- force all horizontal splits to go below current window
	splitbelow = true,

	-- force all vertical splits to go to the right of current window
	splitright = true,

	-- creates a swapfile
	swapfile = false,

	-- convert tabs to spaces
	-- expandtab = false,

	-- set term gui colors (most terminals support this)
	-- termguicolors = true,

	-- time to wait for a mapped sequence to complete (in milliseconds)
	timeoutlen = 1000,

	-- enable persistent undo
	undofile = true,


	-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	writebackup = false,

	-- command height
	-- ch = 0,
}

local window_options = {
	-- sets the fold level
	foldlevel = 2,

	-- the kind of folding used for the current window
	foldmethod = 'indent',

	-- display unprintable characters like tab and trailing spaces
	list = false,

	-- enable the signs column
	signcolumn = 'yes',

	-- Make line numbers default
	number = true,
}

-- local buffer_options = {
-- }

local commands = {
	-- set colorscheme
	'colorscheme rose-pine',

	-- make the sign column transparent
	'highlight clear SignColumn',

	-- make folds transparent
	'highlight clear Folded',

	-- make the split line transparent
	'highlight VertSplit cterm=NONE gui=NONE',

	-- popup menu styling
	'highlight Pmenu ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey',

	-- popup menu styling
	'highlight PmenuSel ctermbg=Grey guibg=Grey ctermfg=Black guifg=Black',

	-- popup menu styling
	'highlight PmenuSbar ctermbg=Black guibg=Black',

	-- popup menu styling
	'highlight PmenuThumb ctermbg=Grey guibg=Grey',

	-- Twilight styling
	'highlight Twilight ctermfg=8',

	-- netrw default listing style (tree style listing)
	'let g:netrw_liststyle = 3',

	-- netrw disable menu
	'let g:netrw_menu = 0',

	-- netrw show all files
	'let g:netrw_hide = 0',

	-- list characters styling
	'set listchars=tab:‹·›,trail:·,lead:·,precedes:«,extends:»',

	-- list characters styling
	'highlight SpecialKey ctermfg=DarkGrey guifg=DarkGrey',

	-- list characters styling
	'highlight NonText ctermfg=DarkGrey guifg=DarkGrey',

	-- lsp styling
	'highlight LspDiagnosticsFloating ctermbg=Black guibg=Black',

	-- lsp styling
	'highlight LspDiagnosticsVirtualTextError ctermfg=Red guifg=Red',

	-- lsp styling
	'highlight LspDiagnosticsVirtualTextWarning ctermfg=Yellow guifg=Yellow',

	-- lsp styling
	'highlight LspDiagnosticsVirtualTextHint ctermfg=Blue guifg=Blue',

	-- lsp styling
	'highlight LspDiagnosticsVirtualTextInformation ctermfg=DarkGrey guifg=DarkGrey',

	-- lsp styling
	'highlight LspDiagnosticsUnderlineError ctermfg=none guifg=none cterm=underline gui=underline',

	-- lsp styling
	'highlight LspDiagnosticsUnderlineWarning ctermfg=none guifg=none cterm=underline gui=underline',

	-- lsp styling
	'highlight LspDiagnosticsUnderlineInformation ctermfg=none guifg=none cterm=underline gui=underline',

	-- lsp styling
	'highlight LspDiagnosticsUnderlineHint ctermfg=none guifg=none cterm=underline gui=underline',

	-- dashes count as whole words
	[[set iskeyword+=-]],
}

-- set options
for key, value in pairs(options) do
	vim.opt[key] = value
end

-- set window_options
for key, value in pairs(window_options) do
	vim.wo[key] = value
end

-- set buffer_options
-- for key, value in pairs(buffer_options) do
-- 	vim.bo[key] = value
-- end

-- execute commands
for _, command in ipairs(commands) do
	vim.cmd(command)
end
