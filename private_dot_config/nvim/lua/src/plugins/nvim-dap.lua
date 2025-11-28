-- TODO: set up for FABL dubugging

MiniDeps.add({
	source = "mfussenegger/nvim-dap",
	depends = {
		{
			source = "rcarriga/nvim-dap-ui",
		},
		{
			source = "nvim-neotest/nvim-nio",
		},
		{
			source = "mxsdev/nvim-dap-vscode-js",
		},
		{
			source = "williamboman/mason.nvim",
		},
		{
			source = "jay-babu/mason-nvim-dap.nvim",
		},
		{
			source = "leoluz/nvim-dap-go",
		},
	},
})

local dap = require("dap")
local dapui = require("dapui")
local dapvscodejs = require("dap-vscode-js")

require("mason-nvim-dap").setup({
	-- Makes a best effort to setup the various debuggers with
	-- reasonable debug configurations
	automatic_setup = true,

	-- You can provide additional configuration to the handlers,
	-- see mason-nvim-dap README for more information
	handlers = {},

	-- You'll need to check that you have the required things installed
	-- online, please don't ask me how to install them :)
	ensure_installed = {
		-- Update this to ensure that you have the debuggers for the langs you want
		"delve",
		"js",
	},
})

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup({
	-- Set icons to characters that are more likely to work in every terminal.
	--    Feel free to remove or use ones that you like more! :)
	--    Don't feel like these are good choices.
	icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
	controls = {
		icons = {
			pause = "⏸",
			play = "▶",
			step_into = "⏎",
			step_over = "⏭",
			step_out = "⏮",
			step_back = "b",
			run_last = "▶▶",
			terminate = "⏹",
			disconnect = "⏏",
		},
	},
})

-- Debug Adapter for JavaScript/Node.js
dapvscodejs.setup({
	node_path = "node", -- Path of the node executable
	-- debugger_path = vscode_js_debug_path,
	debugger_cmd = { "js-debug-adapter"},
	adapters = { "pwa-node" }, -- Supports "pwa-node" for Node.js debugging
})

-- Install golang specific config
require("dap-go").setup()

-- Debugging configuration
for _, language in ipairs({ "javascript", "typescript" }) do
 dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch FABL module",
      program = "${file}",
      cwd = vim.fn.getcwd(), -- You could use "${workspaceFolder}" if launching from project root
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      -- No port! nvim-dap-vscode-js handles this
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to process",
      processId = require("dap.utils").pick_process,
      cwd = vim.fn.getcwd(),
    },
  }
end

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<S-F9>", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Breakpoint" })

-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close
