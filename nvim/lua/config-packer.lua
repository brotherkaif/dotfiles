-- Automatically install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system {
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	}
	print 'Installing packer close and reopen Neovim...'
	vim.cmd [[packadd packer.nvim]]
end

-- initialize and configure packer
local packer = require('packer')
packer.init {
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	display = {
		open_fn = function()
			return require('packer.util').float { border = 'rounded' } -- floating window and rounded border
		end,
	},
}

return packer.startup(function(use)
	-- OS CHECK
	-- local admin = 'sudo '
	-- if vim.fn.has('mac') == 1 then
	-- 	admin = ''
	-- end

	-- PLUGIN MANAGEMENT
	use { 'wbthomason/packer.nvim' }

	-- DEPENDENCY MANAGEMENT
	use { "williamboman/mason.nvim", branch = "alpha" }

	-- TREESITTER
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- LSP
	use { 'neovim/nvim-lspconfig' }

	-- DAP
	use {
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
		},
	}

	-- TELESCOPE
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-file-browser.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		},
	}

	-- DEVELOPMENT
	use { 'terrortylor/nvim-comment' }
	use { 'gpanders/editorconfig.nvim' }

	-- use { 'rhlobo/vim-super-retab' }
	-- use { 'akinsho/toggleterm.nvim', config = function() require('user.configs.toggleterm') end }

	-- -- COMPLETION
	-- use {
	-- 	'hrsh7th/nvim-cmp',
	-- 	requires = {
	-- 		{ 'hrsh7th/nvim-cmp' },
	-- 		{ 'hrsh7th/cmp-buffer' },
	-- 		{ 'hrsh7th/cmp-path' },
	-- 		{ 'f3fora/cmp-spell' },
	-- 		{ 'hrsh7th/cmp-nvim-lsp' },
	-- 		{ 'hrsh7th/cmp-nvim-lua' },
	-- 		{ 'hrsh7th/cmp-vsnip' },
	-- 		{ 'hrsh7th/vim-vsnip' },
	-- 		{ 'rafamadriz/friendly-snippets' },
	-- 	},
	-- 	config = function() require('user.configs.cmp') end
	-- }

	-- LINTING
	-- use {
	-- 	'mhartington/formatter.nvim',
	-- 	config = function() require('user.configs.formatter') end
	-- }

	-- INTERFACE
	use { 'nvim-lualine/lualine.nvim' }
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
		},
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
