MiniDeps.add({
	source = "stevearc/conform.nvim",
	depends = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"biome",
		"markdownlint",
		"eslint_d",
	},

	-- if set to true this will check each tool for updates. If updates
	-- are available the tool will be updated. This setting does not
	-- affect :MasonToolsUpdate or :MasonToolsInstall.
	-- Default: false
	auto_update = false,

	-- automatically install / update on startup. If set to false nothing
	-- will happen on startup. You can use :MasonToolsInstall or
	-- :MasonToolsUpdate to install tools and check for updates.
	-- Default: true
	run_on_start = true,

	-- set a delay (in ms) before the installation starts. This is only
	-- effective if run_on_start is set to true.
	-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
	-- Default: 0
	start_delay = 3000, -- 3 second delay

	-- Only attempt to install if "debounce_hours" number of hours has
	-- elapsed since the last time Neovim was started. This stores a
	-- timestamp in a file named stdpath("data")/mason-tool-installer-debounce.
	-- This is only relevant when you are using "run_on_start". It has no
	-- effect when running manually via ":MasonToolsInstall" etc....
	-- Default: nil
	debounce_hours = 5, -- at least 5 hours between attempts to install/update

	-- By default all integrations are enabled. If you turn on an integration
	-- and you have the required module(s) installed this means you can use
	-- alternative names, supplied by the modules, for the thing that you want
	-- to install. If you turn off the integration (by setting it to false) you
	-- cannot use these alternative names. It also suppresses loading of those
	-- module(s) (assuming any are installed) which is sometimes wanted when
	-- doing lazy loading.
	integrations = {
		["mason-lspconfig"] = true,
		["mason-null-ls"] = true,
		["mason-nvim-dap"] = true,
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		astro = { "biome", "prettier", stop_after_first = true },
		css = { "biome", "prettier", stop_after_first = true },
		graphql = { "biome", "prettier", stop_after_first = true },
		handlebars = { "biome", "prettier", stop_after_first = true },
		html = { "biome", "prettier", stop_after_first = true },
		javascript = { "eslint_d", "biome", "prettier", stop_after_first = true },
		javascriptreact = { "biome", "prettier", stop_after_first = true },
		json = { "biome", "prettier", stop_after_first = true },
		jsonc = { "biome", "prettier", stop_after_first = true },
		less = { "biome", "prettier", stop_after_first = true },
		markdown = { "biome", "prettier", "markdownlint", stop_after_first = true },
		scss = { "biome", "prettier", stop_after_first = true },
		svelte = { "biome", "prettier", stop_after_first = true },
		typescript = { "biome", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettier", stop_after_first = true },
		vue = { "biome", "prettier", stop_after_first = true },
		yaml = { "biome", "prettier", stop_after_first = true },
	},
	formatters = {
		biome = {
			cwd = require("conform.util").root_file({ "package.json" }),
			require_cwd = true,
		},
		prettier = {
			cwd = require("conform.util").root_file({ "package.json" }),
			require_cwd = true,
		},
		eslint_d = {
			cwd = require("conform.util").root_file({ "package.json" }),
			require_cwd = true,
		},
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		-- Disable autoformat for files in a certain path
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if bufname:match("/node_modules/") then
			return
		end
		-- ...additional logic...
		return { timeout_ms = 500, lsp_format = "never" }
	end,
})
