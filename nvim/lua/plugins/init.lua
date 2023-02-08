return {
  -- AI
  'github/copilot.vim',

  -- The obligatory Tim Pope section
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

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
}
