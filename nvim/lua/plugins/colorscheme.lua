local isTrueColor = os.getenv("COLORTERM") == "truecolor"

return {
  -- add mini.hues
  {
    "echasnovski/mini.hues",
    keys = function()
      -- check if truecolor is enabled in terminal
      if isTrueColor then
        -- if so, set Random Hue keymap
        return {
          {
            "<leader>uu",
            function()
              vim.cmd("colorscheme randomhue")
            end,
            desc = "Random Hue",
          },
        }
      else
        -- otherwise, do not set a keymap
        return {}
      end
    end,
  },

  -- add auto-dark-mode.nvim
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        if isTrueColor then
          vim.cmd("colorscheme randomhue")
        else
          -- if not, disable termguicolors
          vim.opt["termguicolors"] = false

          -- and fall back to non truecolor colorscheme
          vim.cmd("colorscheme lunaperche")
        end
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        if isTrueColor then
          vim.cmd("colorscheme randomhue")
        else
          -- if not, disable termguicolors
          vim.opt["termguicolors"] = false

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
        -- otherwise, set colorscheme to randomhue
        return {
          colorscheme = "randomhue",
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
