_G.Config = {
	path_package = vim.fn.stdpath("data") .. "/site/",
	-- path_source = vim.fn.stdpath('config') .. '/src/',
}
-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local mini_path = Config.path_package .. "pack/deps/start/mini.nvim"

if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		-- Uncomment next line to use 'stable' branch
		-- '--branch', 'stable',
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
end

-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup({ path = { package = Config.path_package } })

-- SETTINGS
require("src.settings")
require("src.keymaps")
require("src.functions")

-- PRIORITY PLUGINS
MiniDeps.now(function()
	-- CORE
	require("src.plugins.lsp")
	require("src.plugins.nvim-treesitter")
	require("src.plugins.conform")

	require("src.plugins.mini-completion")
	require("src.plugins.mini-icons")
	require("src.plugins.mini-notify")
	require("src.plugins.mini-sessions")
	require("src.plugins.mini-statusline")
	require("src.plugins.mini-tabline")
	require("src.plugins.mini-basics")
	require("src.plugins.mini-clue")
	require("src.plugins.mini-files")
	require("src.plugins.mini-starter")

	-- OTHER
	require("src.plugins.auto-dark-mode-nvim")
	require("src.plugins.copilot")
end)

-- LAZY PLUGINS
MiniDeps.later(function()
	require("src.plugins.mini-ai")
	require("src.plugins.mini-align")
	require("src.plugins.mini-bracketed")
	require("src.plugins.mini-bufremove")
	require("src.plugins.mini-comment")
	require("src.plugins.mini-cursorword")
	require("src.plugins.mini-doc")
	require("src.plugins.mini-extra")
	require("src.plugins.mini-git")
	require("src.plugins.mini-indentscope")
	require("src.plugins.mini-jump")
	require("src.plugins.mini-jump2d")
	require("src.plugins.mini-operators")
	require("src.plugins.mini-pairs")
	require("src.plugins.mini-pick")
	require("src.plugins.mini-splitjoin")
	require("src.plugins.mini-surround")
	require("src.plugins.mini-trailspace")
	require("src.plugins.mini-visits")
	require("src.plugins.mini-animate")
	require("src.plugins.mini-hipatterns")
	require("src.plugins.mini-map")
	require("src.plugins.mini-move")
end)
-- now(function() require('mini.diff').setup() end)

-- later(function() require('mini.base16').setup() end)
-- later(function() require('mini.colors').setup() end)
-- later(function() require('mini.fuzzy').setup() end)
-- later(function() require('mini.hues').setup() end)
-- later(function() require('mini.misc').setup() end)
-- later(function() require('mini.test').setup() end)
