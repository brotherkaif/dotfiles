require("jester").setup({
	path_to_jest_run = 'node node_modules/jest/bin/jest.js',
	dap = {
		type = 'node2',
		request = 'launch',
		cwd = vim.fn.getcwd(),
		runtimeArgs = { '--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file' },
		args = { '--no-cache' },
		sourceMaps = false,
		protocol = 'inspector',
		skipFiles = { '<node_internals>/**/*.js' },
		console = 'integratedTerminal',
		port = 9229,
		disableOptimisticBPs = true
	}
})

vim.api.nvim_create_user_command('JestRun', 'lua require("jester").run()', { desc = 'Run nearest Jest test(s) under the cursor' })
vim.api.nvim_create_user_command('JestRunFile', 'lua require("jester").run_file()', { desc = 'Run current Jest test file' })
vim.api.nvim_create_user_command('JestRunLast', 'lua require("jester").run_last()', { desc = 'Run last Jest test(s)' })
vim.api.nvim_create_user_command('JestDebug', 'lua require("jester").debug()', { desc = 'Debug nearest Jest test(s) under the cursor' })
vim.api.nvim_create_user_command('JestDebugFile', 'lua require("jester").debug_file()', { desc = 'Debug current Jest test file' })
vim.api.nvim_create_user_command('JestDebugLast', 'lua require("jester").debug_last()', { desc = 'Debug last Jest test(s)' })
