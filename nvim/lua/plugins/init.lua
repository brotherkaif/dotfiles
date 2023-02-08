return {
  {
    -- Hop - Code Navigation
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
    -- gitsigns - Git feedback and integration
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
    -- github-nvim-theme - The most professional theme
    'projekt0n/github-nvim-theme',
    lazy = false,
    branch = '0.0.x',
  },

  {
    -- indent-blankline.nvim - Add indentation guides even on blank lines
    -- See `:help indent_blankline.txt`
    'lukas-reineke/indent-blankline.nvim',
    config = {
      char = '┊',
      show_trailing_blankline_indent = false,
    }
  },

  {
    -- Comment.nvim - Comment toggling
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    config = true
  },

  'hinell/move.nvim', -- Line manipulation

  {
    -- Telescope - Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    init = function()
      pcall(require('telescope').load_extension, 'file_browser')
    end,
    config = {
      defaults = {
        hidden = true,
        layout_strategy = 'flex',
        color_devicons = false,
        layout_config = {
          height = 0.80,
          width = 0.80
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      extensions = {
        file_browser = {
          dir_icon = '›',
          grouped = true,
          hidden = true,
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
          },
        },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable 'make' == 1,
        config = function()
          pcall(require('telescope').load_extension, 'fzf')
        end,
      },
    },
  },
}
