return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        -- Setup mason so it can manage external tooling
        'williamboman/mason.nvim',
        config = true
      },

      {
        -- Ensure the packages below are installed
        'williamboman/mason-lspconfig.nvim',
        config = {
          ensure_installed = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'sumneko_lua', 'gopls' },
        }
      },

      -- Useful status updates for LSP
      {
        'j-hui/fidget.nvim',
        config = true
      },
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  { -- Hop/EasyMotion
    'phaazon/hop.nvim',
    config = true
  },

  -- AI
  'github/copilot.vim',

  -- The obligatory Tim Pope section
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  {
    'lewis6991/gitsigns.nvim',
    config = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  },

  {
    -- The most sophisticated theme
    'rose-pine/neovim',
    name = 'rose-pine',
  },

  {
    -- The most professional theme
    'projekt0n/github-nvim-theme',
    branch = '0.0.x',
  },

  {
    -- Add indentation guides even on blank lines
    -- See `:help indent_blankline.txt`
    'lukas-reineke/indent-blankline.nvim',
    config = {
      char = '┊',
      show_trailing_blankline_indent = false,
    }
  },

  {
    -- Comment.nvim
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    config = true
  },

  'hinell/move.nvim', -- Line manipulation

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
}
