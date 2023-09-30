return {
  -- auto-dark-mode.nvim
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme tokyonight-night")
      end,

      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme tokyonight-day")
      end,
    },
  },

  -- tokyonight transparency override
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
