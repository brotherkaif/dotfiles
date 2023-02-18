return {
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
}
