require('nvim-treesitter.configs').setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
})

if debug_mode==true then
  print('- plugins/treesitter-config.lua...OK!')
end
