packer=require('packer').startup(function()
    -- core
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- quality of life
    use { 'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end }
    use 'rhlobo/vim-super-retab'
    use { 'folke/which-key.nvim', config = function() require('which-key').setup() end }
    use 'editorconfig/editorconfig-vim'
    use 'tpope/vim-fugitive'
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
	'nvim-lua/plenary.nvim'
      },
      config = function()
	require('gitsigns').setup()
      end
    }

    -- telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { "nvim-telescope/telescope-file-browser.nvim" }

    -- window management
    use { 'beauwilliams/focus.nvim', config = function() require('focus').setup() end }

    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'f3fora/cmp-spell'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use "rafamadriz/friendly-snippets"

    -- linting
    use 'mhartington/formatter.nvim'

    -- interface
    use {
      "folke/twilight.nvim",
      config = function()
	require("twilight").setup {
	  -- your configuration comes here
	  -- or leave it empty to use the default settings
	  -- refer to the configuration section below
	}
      end
    }
    use {
      "folke/zen-mode.nvim",
      config = function()
	require("zen-mode").setup {
	  -- your configuration comes here
	  -- or leave it empty to use the default settings
	  -- refer to the configuration section below
	}
      end
    }
    use 'millermedeiros/vim-statline'
end)

if debug_mode==true then
  print('- plugins.lua...OK!')
end

return packer
