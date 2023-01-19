return {
  {
    -- LSP - Configuration & Plugin
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
    -- nvim-cmp - Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  {
    -- Treesitter - Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function ()
      -- [[ Configure Treesitter ]]
      -- See `:help nvim-treesitter`
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help' },

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end
  },

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
    config = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
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
