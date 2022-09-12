require("jester").setup({
	path_to_jest_run = 'node node_modules/jest/bin/jest.js',
	path_to_jest_debug = './node_modules/jest',
	-- dap = {
	--     name = 'Jest test',
	--     type = 'node2',
	--     request = 'launch',
	-- 	cwd = vim.fn.getcwd(),
	-- 	sourceMaps = true,
	-- 	outFiles = {
	-- 		'${workspaceFolder}/src/*.js',
	-- 	},
	-- 	console = 'integratedTerminal',
	-- 	internalConsoleOptions = 'neverOpen',
	--     program = '${workspaceFolder}/node_modules/jest/bin/jest.js',
	--     windows = {
	-- 		program = '${workspaceFolder}/node_modules/jest/bin/jest'
	--     }
	--   }
})

vim.api.nvim_create_user_command('JestRun', 'lua require("jester").run()', { desc = 'Run nearest Jest test(s) under the cursor' })
vim.api.nvim_create_user_command('JestRunFile', 'lua require("jester").run_file()', { desc = 'Run current Jest test file' })
vim.api.nvim_create_user_command('JestRunLast', 'lua require("jester").run_last()', { desc = 'Run last Jest test(s)' })
vim.api.nvim_create_user_command('JestDebug', 'lua require("jester").debug()', { desc = 'Debug nearest Jest test(s) under the cursor' })
vim.api.nvim_create_user_command('JestDebugFile', 'lua require("jester").debug_file()', { desc = 'Debug current Jest test file' })
vim.api.nvim_create_user_command('JestDebugLast', 'lua require("jester").debug_last()', { desc = 'Debug last Jest test(s)' })
