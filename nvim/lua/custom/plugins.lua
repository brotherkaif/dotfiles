return function(use)
  use({ "nvim-telescope/telescope-file-browser.nvim" })

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        vim.cmd('colorscheme rose-pine')
    end
})
end
