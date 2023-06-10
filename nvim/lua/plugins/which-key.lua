return {
  -- which-key - popup menu for keybindings
  'folke/which-key.nvim',
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require('which-key')
    wk.setup()
    wk.register({
      t = {
        name = "[T]erminal",
      },
      s = {
        name = "[S]earch",
      },
      c = {
        name = "[C]ode",
      },
      r = {
        name = "[R]e",
      },
      w = {
        name = "[W]orkspace",
      },
    }, { prefix = "<leader>" })
  end,
}
