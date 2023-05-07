local options = {
	-- set highlight on search
	hlsearch = false,
	-- enable mouse mode
	mouse = 'a',
	-- offset horizontal scrolling
	sidescrolloff = 8,
	-- set how many chars a tab is represented by
	tabstop = 4,
	-- set shifting chars amount
	shiftwidth = 2,
}


local window_options = {
	-- sets the fold level
	foldlevel = 4,
	-- the kind of folding used for the current window
	foldmethod = 'indent',
}

-- local buffer_options = {
-- }

local commands = {}

-- macos specific options
if vim.fn.has('mac') == 1 then
	-- disable term gui colors (most terminals support this)
	options.termguicolors = false
end

-- linux specific options
if vim.fn.has('linux') == 1 then
	-- enable term gui colors (most terminals support this)
	options.termguicolors = true

	-- set colorscheme
	-- table.insert(commands, 'colorscheme minischeme')
end

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
