return {
  {
    -- rose-pine - the most comfortable theme
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    -- config = function()
    --     require('rose-pine').setup()
    --     vim.cmd('colorscheme rose-pine')
    -- end
  },
  {
    -- github-nvim-theme - the most professional theme
    'projekt0n/github-nvim-theme',
    lazy = false,
    branch = '0.0.x',
    config = function()
      vim.cmd('colorscheme github_dark_default')
    end
  },
}
