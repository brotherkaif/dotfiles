return {
  {
    -- dim: Default IMproved
    'jeffkreeftmeijer/vim-dim',
    lazy = false,
    config = function()
      vim.cmd('colorscheme dim')
    end
  },
}
