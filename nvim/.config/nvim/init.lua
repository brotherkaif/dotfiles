--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
-- ===============================
Debug=false

if Debug==true then
	print(' _| _ |_     _ ')
	print('(_|(/_|_)|_|(_|')
	print('             _|')
	print('LOADING CONFIGS...')
end

require('user.plugins')
require('user.options')
require('user.keymaps')

if Debug==true then
	print('COMPLETED')
end
