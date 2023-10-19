local isTrueColor = os.getenv("COLORTERM") == "truecolor"
return {
  { "rose-pine/neovim", name = "rose-pine" },
  { "projekt0n/github-nvim-theme" },

  -- add auto-dark-mode.nvim
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        if isTrueColor then
          vim.cmd("colorscheme github_dark_high_contrast")
        else
          -- and fall back to non truecolor colorscheme
          vim.cmd("colorscheme lunaperche")
        end
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        if isTrueColor then
          vim.cmd("colorscheme github_light_high_contrast")
        else
          -- and fall back to non truecolor colorscheme
          vim.cmd("colorscheme lunaperche")
        end
      end,
    },
  },

  -- Configure LazyVim
  {
    "LazyVim/LazyVim",
    opts = function()
      -- check if truecolor is enabled in terminal
      if isTrueColor then
        -- otherwise, set colorscheme to github_dark_high_contrast
        return {
          colorscheme = "github_dark_high_contrast",
        }
      else
        -- if not, disable termguicolors
        vim.opt["termguicolors"] = false

        -- and fall back to non truecolor colorscheme
        return {
          colorscheme = "lunaperche",
        }
      end
    end,
  },
}
