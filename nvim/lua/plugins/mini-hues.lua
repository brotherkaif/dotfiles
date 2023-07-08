return {
  -- add mini.hues
  { "echasnovski/mini.hues" },

  -- Configure LazyVim to load randomhue
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<leader>uh",
        function()
          vim.cmd("colorscheme randomhue")
        end,
        desc = "Random Hue",
      },
    },
    opts = {
      colorscheme = "randomhue",
    },
  },
}