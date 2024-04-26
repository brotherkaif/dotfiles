require('conform').setup({
  -- Map of filetype to formatters
  formatters_by_ft = {
    javascript = { 'prettier' },
    json = { 'prettier' },
    lua = { 'stylua' },
  },
})
