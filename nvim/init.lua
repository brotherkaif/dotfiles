-- INIT =============================================================
pcall(function() vim.loader.enable() end)

-- Define main config table
_G.Config = {
	path_package = vim.fn.stdpath('data') .. '/site/',
	path_source = vim.fn.stdpath('config') .. '/src/',
}

-- Ensure 'mini.nvim' is set up
local mini_path = Config.path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
	vim.cmd([[echo "Installing 'mini.nvim'" | redraw]])
	local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
	vim.fn.system(clone_cmd)
end

require('mini.deps').setup({ path = { package = Config.path_package } })

-- Define helpers
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local source = function(path) dofile(Config.path_source .. path) end

-- SETTINGS AND MAPPINGS ======================================================
now(function() source('settings.lua') end)
now(function() source('mappings.lua') end)
now(function() source('functions.lua') end)
-- now(function() source('mappings-leader.lua') end)
-- if vim.g.vscode ~= nil then now(function() source('vscode.lua') end) end

-- Mini.nvim ==================================================================
add({ name = 'mini.nvim', checkout = 'HEAD' })

-- PRIORITY
now(function() require('mini.notify').setup() end)
now(function() require('mini.sessions').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() source('plugins/mini-starter.lua') end)
now(function() source('plugins/mini-basics.lua') end)
now(function() add('nvim-tree/nvim-web-devicons') end)

now(function()
	add('f-person/auto-dark-mode.nvim')
	source('plugins/auto-dark-mode-nvim.lua')
end)



-- LAZY
later(function() require('mini.extra').setup() end)
later(function() require('mini.ai').setup() end)
later(function() require('mini.align').setup() end)
later(function() require('mini.bracketed').setup() end)
later(function() require('mini.bufremove').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.completion').setup() end)
later(function() require('mini.cursorword').setup() end)
later(function() require('mini.diff').setup() end)
later(function() require('mini.doc').setup() end)
later(function() require('mini.indentscope').setup() end)
later(function() require('mini.jump').setup() end)
later(function() require('mini.jump2d').setup() end)
later(function() require('mini.operators').setup() end)
later(function() require('mini.pick').setup() end)
later(function() require('mini.surround').setup() end)
later(function() require('mini.splitjoin').setup() end)
later(function() require('mini.trailspace').setup() end)
later(function() require('mini.visits').setup() end)
later(function() require('mini.pairs').setup() end)
later(function() source('plugins/mini-animate.lua') end)
later(function() source('plugins/mini-clue.lua') end)
later(function() source('plugins/mini-files.lua') end)
later(function() source('plugins/mini-hipatterns.lua') end)
later(function() source('plugins/mini-map.lua') end)
later(function() source('plugins/mini-move.lua') end)

later(function()
	add({
		source = 'neovim/nvim-lspconfig',
		depends = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim'
		},
	})
	source('plugins/nvim-lspconfig.lua')
end)

later(function()
	local ts_spec = {
		source = 'nvim-treesitter/nvim-treesitter',
		checkout = 'master',
		hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
	}
	add({ source = 'nvim-treesitter/nvim-treesitter-textobjects', depends = { ts_spec } })
	source('plugins/nvim-treesitter.lua')
end)

later(function()
	add('stevearc/conform.nvim')
	source('plugins/conform.lua')
end)

later(function()
	add('lewis6991/gitsigns.nvim')
	source('plugins/gitsigns.lua')
end)

-- later(function() require('mini.base16').setup() end)
-- later(function() require('mini.colors').setup() end)
-- later(function() require('mini.fuzzy').setup() end)
-- later(function() require('mini.hues').setup() end)
-- later(function() require('mini.misc').setup() end)
-- later(function() require('mini.test').setup() end)
