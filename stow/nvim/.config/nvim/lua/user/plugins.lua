local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
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
    use { 'nvim-telescope/telescope-file-browser.nvim' }

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
    use 'rafamadriz/friendly-snippets'

    -- linting
    use 'mhartington/formatter.nvim'

    -- interface
    use { 'folke/twilight.nvim', config = function() require('twilight').setup() end }
    use { 'folke/zen-mode.nvim', config = function() require('zen-mode').setup() end }
    use 'millermedeiros/vim-statline'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end

  if debug_mode==true then
    print('- plugins.lua...OK!')
  end
end)


