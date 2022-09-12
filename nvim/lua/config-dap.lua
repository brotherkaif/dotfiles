local dap, dapui = require("dap"), require("dapui")

local install_root_dir = vim.fn.stdpath "data" .. "/mason/packages"

local opts = { noremap = true, silent = true }
vim.keymap.set('n', "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
vim.keymap.set('n', "<S-F5>", "<Cmd>lua require'dap'.stop()<CR>", opts)
vim.keymap.set('n', "<F9>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set('n', "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
vim.keymap.set('n', "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
vim.keymap.set('n', "<S-F11>", "<Cmd>lua require'dap'.step_out()<CR>", opts)

dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = { install_root_dir .. '/node-debug2-adapter/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
	{
		name = 'Launch',
		type = 'node2',
		request = 'launch',
		program = '${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal',
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = 'Attach to process',
		type = 'node2',
		request = 'attach',
		processId = require 'dap.utils'.pick_process,
	},
}

dap.configurations.typescript = {
	{
		name = 'Launch',
		type = 'node2',
		request = 'launch',
		program = '${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal',
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = 'Attach to process',
		type = 'node2',
		request = 'attach',
		processId = require 'dap.utils'.pick_process,
	},
}

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end
