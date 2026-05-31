-- ┌─────────────────────────┐
-- │ Plugins outside of MINI │
-- └─────────────────────────┘
--
-- This file contains installation and configuration of plugins outside of MINI.
-- They significantly improve user experience in a way not yet possible with MINI.
-- These are mostly plugins that provide programming language specific behavior.
--
-- Use this file to install and configure other such plugins.

-- Make concise helpers for installing/adding plugins in two stages
local add, later = MiniDeps.add, MiniDeps.later
local now_if_args = Config.now_if_args

-- Tree-sitter ================================================================

-- Tree-sitter is a tool for fast incremental parsing. It converts text into
-- a hierarchical structure (called tree) that can be used to implement advanced
-- and/or more precise actions: syntax highlighting, textobjects, indent, etc.
--
-- Tree-sitter support is built into Neovim (see `:h treesitter`). However, it
-- requires two extra pieces that don't come with Neovim directly:
-- - Language parsers: programs that convert text into trees. Some are built-in
--   (like for Lua), 'nvim-treesitter' provides many others.
--   NOTE: It requires third party software to build and install parsers.
--   See the link for more info in "Requirements" section of the MiniMax README.
-- - Query files: definitions of how to extract information from trees in
--   a useful manner (see `:h treesitter-query`). 'nvim-treesitter' also provides
--   these, while 'nvim-treesitter-textobjects' provides the ones for Neovim
--   textobjects (see `:h text-objects`, `:h MiniAi.gen_spec.treesitter()`).
--
-- Add these plugins now if file (and not 'mini.starter') is shown after startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.treesitter nvim-treesitter` to see potential issues.
-- - In case of errors related to queries for Neovim bundled parsers (like `lua`,
--   `vimdoc`, `markdown`, etc.), manually install them via 'nvim-treesitter'
--   with `:TSInstall <language>`. Be sure to have necessary system dependencies
--   (see MiniMax README section for software requirements).
now_if_args(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Update tree-sitter parser after plugin is updated
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
    -- Pin to the commit just before the plugin dropped Neovim=0.11 support
    checkout = '90cd6580e720caedacb91fdd587b747a6e77d61f',
  })
  add({
    source = 'nvim-treesitter/nvim-treesitter-textobjects',
    -- Pin to the commit corresponding to 'nvim-treesitter' commit
    checkout = '93d60a475f0b08a8eceb99255863977d3a25f310',
  })

  -- Define languages which will have parsers installed and auto enabled
  -- After changing this, restart Neovim once to install necessary parsers. Wait
  -- for the installation to finish before opening a file for added language(s).
  local languages = {
    -- These are already pre-installed with Neovim. Used as an example.
    'lua',
    'vimdoc',
    'markdown',
    -- Add here more languages with which you want to use tree-sitter
    -- To see available languages:
    -- - Execute `:=require('nvim-treesitter').get_available()`
    -- - Visit 'SUPPORTED_LANGUAGES.md' file at
    --   https://github.com/nvim-treesitter/nvim-treesitter
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- Language servers ===========================================================

-- Language Server Protocol (LSP) is a set of conventions that power creation of
-- language specific tools. It requires two parts:
-- - Server - program that performs language specific computations.
-- - Client - program that asks server for computations and shows results.
--
-- Here Neovim itself is a client (see `:h vim.lsp`). Language servers need to
-- be installed separately based on your OS, CLI tools, and preferences.
-- See note about 'mason.nvim' at the bottom of the file.
--
-- Neovim's team collects commonly used configurations for most language servers
-- inside 'neovim/nvim-lspconfig' plugin.
--
-- Add it now if file (and not 'mini.starter') is shown after startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.lsp` to see potential issues.

local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {
	clangd = {},
	cssls = {},
	eslint = {},
	gopls = {},
	html = {},
	jsonls = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				disable = { "missing-fields" },
				globals = { "vim", "MiniDeps" },
			},
		},
	},
	ts_ls = {},
}

now_if_args(function()
	add("neovim/nvim-lspconfig")

	local lspconfig = require("lspconfig")

	for server_name, server_config in pairs(servers) do
		-- Using .setup() handles the filetype detection and command routing automatically
		lspconfig[server_name].setup({
			capabilities = capabilities,
			settings = server_config,
		})
	end
end)

-- Formatting =================================================================

-- Programs dedicated to text formatting (a.k.a. formatters) are very useful.
-- Neovim has built-in tools for text formatting (see `:h gq` and `:h 'formatprg'`).
-- They can be used to configure external programs, but it might become tedious.
--
-- The 'stevearc/conform.nvim' plugin is a good and maintained solution for easier
-- formatting setup.
later(function()
	add({
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
			"js-debug-adapter",
		},
		start_delay = 3000,
		debounce_hours = 5,
	})

	-- See also:
	-- - `:h Conform`
	-- - `:h conform-options`
	-- - `:h conform-formatters`
	require("conform").setup({
		-- Map of filetype to formatters
		-- Make sure that necessary CLI tool is available
		-- formatters_by_ft = { lua = { 'stylua' } },
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
			typescript = { "eslint_d", "biome", "prettier", stop_after_first = true },
			typescriptreact = { "biome", "prettier", stop_after_first = true },
			vue = { "biome", "prettier", stop_after_first = true },
			yaml = { "biome", "prettier", stop_after_first = true },
		},
		formatters = {
			eslint_d = {
				cwd = require("conform.util").root_file({ "package.json" }),
				require_cwd = true,
			},
			prettier = {
				cwd = require("conform.util").root_file({ "package.json" }),
				require_cwd = true,
			},
			biome = {
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
end)

-- Snippets ===================================================================

-- Although 'mini.snippets' provides functionality to manage snippet files, it
-- deliberately doesn't come with those.
--
-- The 'rafamadriz/friendly-snippets' is currently the largest collection of
-- snippet files. They are organized in 'snippets/' directory (mostly) per language.
-- 'mini.snippets' is designed to work with it as seamlessly as possible.
-- See `:h MiniSnippets.gen_loader.from_lang()`.
later(function()
	add("rafamadriz/friendly-snippets")
end)

-- Honorable mentions =========================================================

-- 'mason-org/mason.nvim' (a.k.a. "Mason") is a great tool (package manager) for
-- installing external language servers, formatters, and linters. It provides
-- a unified interface for installing, updating, and deleting such programs.
--
-- The caveat is that these programs will be set up to be mostly used inside Neovim.
-- If you need them to work elsewhere, consider using other package managers.
--
-- You can use it like so:
now_if_args(function()
	add({
		source = "mason-org/mason.nvim",
		depends = {
			"mason-org/mason-lspconfig.nvim",
		},
	})

	require("mason").setup()

	require("mason-lspconfig").setup({
		ensure_installed = vim.tbl_keys(servers),
		automatic_enable = true,
	})
end)

-- Beautiful, usable, well maintained color schemes outside of 'mini.nvim' and
-- have full support of its highlight groups. Use if you don't like 'miniwinter'
-- enabled in 'plugin/30_mini.lua' or other suggested 'mini.hues' based ones.
-- MiniDeps.now(function()
--   -- Install only those that you need
--   add('sainnhe/everforest')
--   add('Shatur/neovim-ayu')
--   add('ellisonleao/gruvbox.nvim')
--
--   -- Enable only one
--   vim.cmd('color everforest')
-- end)

-- Debugging ===================================================================

-- DAP (Debug Adapter Protocol) provides a standardized way for editors to
-- communicate with debuggers. This is the Neovim equivalent of VSCode's
-- built-in debugger. It allows setting breakpoints, stepping through code,
-- inspecting variables, and attaching to running processes (e.g. `fabl serve`).
--
-- The 'js-debug-adapter' (installed via Mason above) is Microsoft's own
-- JavaScript/Node.js debugger extracted from VSCode.
--
-- Example usage for FABL modules:
-- - Start `fabl serve` in a terminal
-- - Press `<Leader>dc` and select "Attach to process"
-- - Pick the Node.js process running `fabl serve`
-- - Set breakpoints with `<Leader>db`
-- - Make a `curl` request to trigger your module
--
-- See also:
-- - `:h dap.txt` - nvim-dap documentation
-- - `:h dap-configuration` - how to configure debug adapters
later(function()
	add({
		source = "mfussenegger/nvim-dap",
	})

	add({
		source = "rcarriga/nvim-dap-ui",
		depends = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	})

	local dap = require("dap")
	local dapui = require("dapui")

	-- Adapter: use Mason-installed js-debug-adapter (pwa-node)
	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			args = {
				vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
				"${port}",
			},
		},
		options = {
			max_retries = 35,
		},
	}

	-- Configurations for JavaScript and TypeScript
	local js_config = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch current file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to process",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "FABL: Execute module",
			program = "${workspaceFolder}/node_modules/.bin/fabl",
			args = function()
				local args_str = vim.fn.input("fabl execute args (e.g. -p 'id=123'): ")
				local args = { "execute", "--no-sandbox" }
				for arg in args_str:gmatch("%S+") do
					table.insert(args, arg)
				end
				return args
			end,
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			-- This is the critical fix: debug child processes spawned by the CLI
			autoAttachChildProcesses = true,
			-- Remove restrictive source map filtering so breakpoints can resolve
			resolveSourceMapLocations = nil,
			skipFiles = { "<node_internals>/**" },
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Vitest: Run tests (cwd)",
			port = 9229,
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			resolveSourceMapLocations = nil,
			skipFiles = { "<node_internals>/**" },
			continueOnAttach = true,
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Vitest: Run current file (cwd)",
			port = 9229,
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			resolveSourceMapLocations = nil,
			skipFiles = { "<node_internals>/**" },
			continueOnAttach = true,
		},
	}

	dap.configurations.javascript = js_config
	dap.configurations.typescript = js_config

	-- DAP UI setup with auto open/close
	dapui.setup()

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end)

-- Extra Plugins ==============================================================

-- Copilot
later(function()
	add("github/copilot.vim")
	vim.cmd(":Copilot disable")
end)
