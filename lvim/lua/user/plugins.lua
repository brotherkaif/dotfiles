lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    requires = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
}
