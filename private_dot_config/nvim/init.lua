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
	require("src.plugins.mini-nvim")
	require("src.plugins.nvim-dap")

	-- OTHER
	require("src.plugins.auto-dark-mode-nvim")
	require("src.plugins.copilot")
	require("src.plugins.friendly-snippets")
	require("src.plugins.guess-indent-nvim")
end)

-- LAZY PLUGINS
MiniDeps.later(function()
end)
