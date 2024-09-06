require('conform').setup({
  -- Map of filetype to formatters
  formatters_by_ft = {
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    json = { 'prettier' },
    lua = { 'stylua' },
  },
})
