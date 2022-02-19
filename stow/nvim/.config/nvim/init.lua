--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
debug_mode=false

if debug_mode==true then
  print(' _| _ |_     _ ')
  print('(_|(/_|_)|_|(_|')
  print('             _|')
  print('LOADING CONFIGS...')
end

require('options')
require('lsp')
require('binds')
require('plugins')
require('plugins/treesitter-config')
require('plugins/telescope-config')
require('plugins/nvim-cmp-config')
require('plugins/formatter-config')
require('plugins/which-key-config')

if debug_mode==true then
  print('COMPLETED')
end
