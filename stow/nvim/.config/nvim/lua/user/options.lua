local options = {
	backup = false,								-- creates a backup file
	clipboard = 'unnamedplus',					-- allows neovim to access the system clipboard
	completeopt = { 'menuone', 'noselect' },	-- mostly just for cmp
	conceallevel = 0,							-- so that `` is visible in markdown files
	cursorline = true,							-- highlight the current line
	errorbells = false,							-- disable terminal error bell
	expandtab = false,							-- convert tabs to spaces
	fileencoding = 'utf-8',						-- the encoding written to a file
	guifont = 'monospace:h17',					-- the font used in graphical neovim applications
	hlsearch = true,							-- highlight all matches on previous search pattern
	ignorecase = true,							-- ignore case in search patterns
	mouse = 'a',								-- allow the mouse to be used in neovim
	number = true,								-- set numbered lines
	numberwidth = 2,							-- set number column width to 2 {default 4}
	pumheight = 10,								-- pop up menu height
	relativenumber = false,						-- set relative numbered lines
	scrolloff = 8,								-- offset vertical scrolling
	shiftwidth = 4,								-- the number of spaces inserted for each indentation
	showmatch = true,							-- highlight matches on search pattern in real time
	showmode = false,							-- we don't need to see things like -- INSERT -- anymore
	showtabline = 2,							-- always show tabs
	sidescrolloff = 8,							-- offset horizontal scrolling
	signcolumn = 'yes',							-- always show the sign column, otherwise it would shift the text each time
	smartcase = true,							-- smart case
	smartindent = true,							-- make indenting smarter again
	splitbelow = true,							-- force all horizontal splits to go below current window
	splitright = true,							-- force all vertical splits to go to the right of current window
	swapfile = false,							-- creates a swapfile
	tabstop = 4,								-- insert 2 spaces for a tab
	-- termguicolors = true,					-- set term gui colors (most terminals support this)
	timeoutlen = 1000,							-- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,							-- enable persistent undo
	updatetime = 300,							-- faster completion (4000ms default)
	wrap = false,								-- display lines as one long line
	writebackup = false,						-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

local window_options = {
	foldlevel = 2,			-- sets the fold level
	foldmethod = 'indent',	-- the kind of folding used for the current window
	list = true,			-- display unprintable characters like tab and trailing spaces
	signcolumn = 'yes',		-- enable the signs column
}

local buffer_options = {
	softtabstop = 0,	-- number of spaces to add to get to next tabstop
}

local commands = {
	'highlight clear SignColumn',																			-- make the sign column transparent
	'highlight clear Folded',																				-- make folds transparent
	'highlight VertSplit cterm=NONE gui=NONE',																-- make the split line transparent
	'highlight Pmenu ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey',									-- popup menu styling
	'highlight PmenuSel ctermbg=Grey guibg=Grey ctermfg=Black guifg=Black',									-- popup menu styling
	'highlight PmenuSbar ctermbg=Black guibg=Black',														-- popup menu styling
	'highlight PmenuThumb ctermbg=Grey guibg=Grey',															-- popup menu styling
	'highlight Twilight ctermfg=8',																			-- Twilight styling
	'let g:netrw_liststyle = 3',																			-- netrw default listing style (tree style listing)
	'let g:netrw_menu = 0',																					-- netrw disable menu
	'let g:netrw_hide = 0',																					-- netrw show all files
	'set listchars=tab:‹·›,trail:·,lead:·,precedes:«,extends:»',											-- list characters styling
	'highlight SpecialKey ctermfg=DarkGrey guifg=DarkGrey',													-- list characters styling
	'highlight NonText ctermfg=DarkGrey guifg=DarkGrey',													-- list characters styling
	'highlight LspDiagnosticsFloating ctermbg=Black guibg=Black',											-- lsp styling
	'highlight LspDiagnosticsVirtualTextError ctermfg=Red guifg=Red',										-- lsp styling
	'highlight LspDiagnosticsVirtualTextWarning ctermfg=Yellow guifg=Yellow',								-- lsp styling
	'highlight LspDiagnosticsVirtualTextHint ctermfg=Blue guifg=Blue',										-- lsp styling
	'highlight LspDiagnosticsVirtualTextInformation ctermfg=DarkGrey guifg=DarkGrey',						-- lsp styling
	'highlight LspDiagnosticsUnderlineError ctermfg=none guifg=none cterm=underline gui=underline',			-- lsp styling
	'highlight LspDiagnosticsUnderlineWarning ctermfg=none guifg=none cterm=underline gui=underline',		-- lsp styling
	'highlight LspDiagnosticsUnderlineInformation ctermfg=none guifg=none cterm=underline gui=underline',	-- lsp styling
	'highlight LspDiagnosticsUnderlineHint ctermfg=none guifg=none cterm=underline gui=underline',			-- lsp styling
	'set whichwrap+=<,>,[,],h,l',																			-- allow cursor left/right to move to the previous/next line
	[[set iskeyword+=-]],																					-- dashes count as whole words
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
for key, value in pairs(buffer_options) do
	vim.bo[key] = value
end

-- execute commands
for _, command in ipairs(commands) do
	vim.cmd(command)
end

-- DEBUG
if debug_mode==true then
	print('- options.lua...OK!')
end
