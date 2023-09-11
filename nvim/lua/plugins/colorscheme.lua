return {
  -- add mini.hues
  { "echasnovski/mini.hues" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",

    keys = function()
      -- check if truecolor is enabled in terminal
      if os.getenv("COLORTERM") == "truecolor" then
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

    opts = function()
      -- check if truecolor is enabled in terminal
      if os.getenv("COLORTERM") ~= "truecolor" then
        -- if not, disable termguicolors
        vim.opt["termguicolors"] = false

        -- and fall back to non truecolor colorscheme
        return {
          colorscheme = "habamax",
        }
      else
        -- otherwise, set colorscheme to randomhue
        return {
          colorscheme = "randomhue",
        }
      end
    end,
  },
}
