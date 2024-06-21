require('conform').setup({
  -- Map of filetype to formatters
  formatters_by_ft = {
    javascript = { 'eslint_d', 'prettier' },
    typescript = { 'eslint_d', 'prettier' },
    json = { 'prettier' },
    lua = { 'stylua' },
  },
})
