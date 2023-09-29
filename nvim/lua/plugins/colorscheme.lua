return {
  -- auto-dark-mode.nvim
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        -- vim.cmd("colorscheme lunaperche")
      end,

      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        -- vim.cmd("colorscheme lunaperche")
      end,
    },
  },

  -- Configure LazyVim
  {
    "LazyVim/LazyVim",
    opts = function()
      -- check if truecolor is enabled in terminal
      local trueColor = os.getenv("COLORTERM") == "truecolor"

      if not trueColor then
        vim.opt.termguicolors = false
        vim.o.pumblend = 0
      end

      return {
        colorscheme = "lunaperche",
      }
    end,
  },
}
