return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = function()
      if os.getenv("COLORTERM") ~= "truecolor" then
        -- disable termguicolors
        vim.opt["termguicolors"] = false

        return {
          colorscheme = "habomax",
        }
      else
        -- -- enable termguicolors
        vim.opt["termguicolors"] = true

        return {
          colorscheme = "tokyonight",
        }
      end
    end,
  },
}
