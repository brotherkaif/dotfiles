_G.Config = {
	path_package = vim.fn.stdpath('data') .. '/site/',
	-- path_source = vim.fn.stdpath('config') .. '/src/',
}
-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local mini_path = Config.path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = Config.path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- SETTINGS
now(function() require('src.settings') end)
now(function() require('src.keymaps') end)
now(function() require('src.functions') end)

-- PRIORITY PLUGINS
now(function() require('mini.notify').setup() end)
now(function() require('mini.sessions').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.completion').setup() end)
now(function() require('src.plugins.mini-clue') end)
now(function() require('src.plugins.mini-basics') end)
now(function() require('src.plugins.mini-files') end)
now(function() require('src.plugins.mini-starter') end)
now(function() add('nvim-tree/nvim-web-devicons') end)

now(function()
	add({
		source = 'neovim/nvim-lspconfig',
		depends = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim'
		},
	})
	require('src.plugins.nvim-lspconfig')
end)

now(function()
	add('f-person/auto-dark-mode.nvim')
	require('src.plugins.auto-dark-mode-nvim')
end)

-- LAZY PLUGINS
later(function() require('mini.extra').setup() end)
later(function() require('mini.ai').setup() end)
later(function() require('mini.align').setup() end)
later(function() require('mini.bracketed').setup() end)
later(function() require('mini.bufremove').setup() end)
later(function() require('mini.comment').setup() end)
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
later(function() require('src.plugins.mini-animate') end)
later(function() require('src.plugins.mini-hipatterns') end)
later(function() require('src.plugins.mini-map') end)
later(function() require('src.plugins.mini-move') end)

later(function()
	local ts_spec = {
		source = 'nvim-treesitter/nvim-treesitter',
		checkout = 'master',
		hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
	}
	add({ source = 'nvim-treesitter/nvim-treesitter-textobjects', depends = { ts_spec } })
	require('src.plugins.nvim-treesitter')
end)

later(function()
	add('stevearc/conform.nvim')
	require('src.plugins.conform')
end)

later(function()
	add('lewis6991/gitsigns.nvim')
	require('src.plugins.gitsigns')
end)

-- later(function() require('mini.base16').setup() end)
-- later(function() require('mini.colors').setup() end)
-- later(function() require('mini.fuzzy').setup() end)
-- later(function() require('mini.hues').setup() end)
-- later(function() require('mini.misc').setup() end)
-- later(function() require('mini.test').setup() end)
