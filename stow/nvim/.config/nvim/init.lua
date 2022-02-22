--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
-- ===============================

debug_mode=false

if debug_mode==true then
  print(' _| _ |_     _ ')
  print('(_|(/_|_)|_|(_|')
  print('             _|')
  print('LOADING CONFIGS...')
end

require('user.options')
require('user.lsp')
require('user.binds')
require('user.plugins')
require('user.plugins/treesitter-config')
require('user.plugins/telescope-config')
require('user.plugins/nvim-cmp-config')
require('user.plugins/formatter-config')
require('user.plugins/which-key-config')

if debug_mode==true then
  print('COMPLETED')
end
