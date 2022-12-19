require("jester").setup({
	path_to_jest_run = 'node ' .. vim.fn.getcwd() .. '/node_modules/jest/bin/jest.js',
	path_to_jest_debug = vim.fn.getcwd() .. '/node_modules/jest/bin/jest.js',
	-- TODO: figure out how to set LOG_LEVEL=silent
	-- TODO: change this to toggleterm
  -- terminal_cmd = ":vsplit | terminal"
})

vim.api.nvim_create_user_command('JestRun', 'lua require("jester").run()', { desc = 'Run nearest Jest test(s) under the cursor' })
vim.api.nvim_create_user_command('JestRunFile', 'lua require("jester").run_file()', { desc = 'Run current Jest test file' })
vim.api.nvim_create_user_command('JestRunLast', 'lua require("jester").run_last()', { desc = 'Run last Jest test(s)' })
vim.api.nvim_create_user_command('JestDebug', 'lua require("jester").debug()', { desc = 'Debug nearest Jest test(s) under the cursor' })
vim.api.nvim_create_user_command('JestDebugFile', 'lua require("jester").debug_file()', { desc = 'Debug current Jest test file' })
vim.api.nvim_create_user_command('JestDebugLast', 'lua require("jester").debug_last()', { desc = 'Debug last Jest test(s)' })
