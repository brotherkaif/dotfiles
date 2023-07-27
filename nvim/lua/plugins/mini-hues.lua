return {
  -- add mini.hues
  { "echasnovski/mini.hues" },

  -- Configure LazyVim to load randomhue
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<leader>uu",
        function()
          vim.cmd("colorscheme randomhue")
        end,
        desc = "Random Hue",
      },
    },
    opts = function()
      if os.getenv("COLORTERM") ~= "truecolor" then
        -- disable termguicolors
        vim.opt["termguicolors"] = false

        -- set default colorscheme
        return {
          colorscheme = "default",
        }
      else
        -- enable termguicolors
        vim.opt["termguicolors"] = true

        return {
          colorscheme = "randomhue",
        }
      end
    end,
  },
}
