-- TODO: add legacy terminal overrides
-- TODO: refactor to not use iterator

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
	guifont = 'FiraCode Nerd Font Mono:h12',

	-- offset vertical scrolling
	scrolloff = 8,

	-- offset horizontal scrolling
	sidescrolloff = 8,

	-- always show tabs
	showtabline = 2,

	-- make indenting smarter again
	smartindent = true,

	-- force all horizontal splits to go below current window
	splitbelow = true,

	-- force all vertical splits to go to the right of current window
	splitright = true,

	-- creates a swapfile
	swapfile = false,

	-- set how many chars a tab is represented by
	tabstop = 4,

	-- set shifting chars amount
	shiftwidth = 2,

	-- convert tabs to spaces
	expandtab = false,

	-- set term gui colors (most terminals support this)
	termguicolors = true,

	-- time to wait for a mapped sequence to complete (in milliseconds)
	timeoutlen = 1000,

	-- enable persistent undo
	undofile = true,

	-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	writebackup = false,
}

local window_options = {
	-- sets the fold level
	foldlevel = 4,

	-- the kind of folding used for the current window
	foldmethod = 'indent',

	-- display unprintable characters like tab and trailing spaces
	list = true,

	-- enable the signs column
	signcolumn = 'yes',

	-- Make line numbers default
	number = true,
}

-- local buffer_options = {
-- }

local commands = {
	-- set colorscheme
	"colorscheme rose-pine-main"
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
