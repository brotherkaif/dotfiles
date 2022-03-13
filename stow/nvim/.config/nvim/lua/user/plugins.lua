local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
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
	-- OS check
	local admin = ''
	if vim.fn.has('unix') == 1 then
		admin = 'sudo '
	end

	-- plugins
	use { 'wbthomason/packer.nvim' }

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require('user.configs.nvim-treesitter') end
	}

	-- lsp
	use {
		'williamboman/nvim-lsp-installer',
		requires = {
			{ 'neovim/nvim-lspconfig' },
			{ 'jose-elias-alvarez/null-ls.nvim', run = admin .. 'npm install -g prettierd eslint_d'},
		},
		config = function() require('user.configs.lsp') end
	}

	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
			{ 'nvim-telescope/telescope-file-browser.nvim' },
		},
		config = function() require('user.configs.telescope') end
	}

	-- quality of life
	use { 'terrortylor/nvim-comment', config = function() require('user.configs.nvim_comment') end }
	use { 'rhlobo/vim-super-retab' }
	use { 'folke/which-key.nvim', config = function() require('user.configs.which-key') end }
	use { 'editorconfig/editorconfig-vim' }
	use { 'tpope/vim-fugitive' }
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
		},
		config = function() require('user.configs.gitsigns') end
	}

	-- window management
	use { 'beauwilliams/focus.nvim', config = function() require('user.configs.focus') end }

	-- completion
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'f3fora/cmp-spell' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'hrsh7th/cmp-vsnip' },
			{ 'hrsh7th/vim-vsnip' },
			{ 'rafamadriz/friendly-snippets' },
		},
		config = function() require('user.configs.cmp') end
	}

	-- linting
	use {
		'mhartington/formatter.nvim',
		config = function() require('user.configs.formatter') end
	}

	-- interface
	use { 'folke/twilight.nvim', config = function() require('user.configs.twilight') end }
	use { 'folke/zen-mode.nvim', config = function() require('user.configs.zen-mode') end }
	use { 'millermedeiros/vim-statline' }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end

	if Debug==true then
		print('- plugins.lua...OK!')
	end
end)
