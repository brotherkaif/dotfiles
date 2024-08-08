require('conform').setup({
  -- Map of filetype to formatters
  formatters_by_ft = {
    javascript = { { 'biome', 'prettier', 'eslint_d' } },
    typescript = { { 'biome', 'prettier', 'eslint_d' } },
    markdown = { 'prettier' },
    json = { { 'biome', 'prettier' } },
    lua = { 'stylua' },
  },
})
