return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      extra_groups = {
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NormalFloat",
      },
      exclude_groups = {
        "CursorLine",
        "CursorLineNr",
        "NotifyBackground",
      },
    })
  end,
}
