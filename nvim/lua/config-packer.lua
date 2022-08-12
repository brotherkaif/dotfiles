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
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}

	-- TREESITTER
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- LSP
	use { 'neovim/nvim-lspconfig' }
	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
		},
	}

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
	use { 'voldikss/vim-floaterm' }
	use { 'terrortylor/nvim-comment' }
	use { 'gpanders/editorconfig.nvim' }
	use { 'vim-test/vim-test' }

	-- COMPLETION
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/vim-vsnip' },
			{ 'hrsh7th/cmp-vsnip' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'f3fora/cmp-spell' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'rafamadriz/friendly-snippets' },
			{ 'andys8/vscode-jest-snippets' },
		},
	}

	-- INTERFACE
	use { 'nvim-lualine/lualine.nvim' }
	use { 'chentoast/marks.nvim' }
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
