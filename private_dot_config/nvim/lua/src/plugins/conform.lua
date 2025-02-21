MiniDeps.add("stevearc/conform.nvim")

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		astro = { "biome", "prettier", stop_after_first = true },
		css = { "biome", "prettier", stop_after_first = true },
		graphql = { "biome", "prettier", stop_after_first = true },
		handlebars = { "biome", "prettier", stop_after_first = true },
		html = { "biome", "prettier", stop_after_first = true },
		javascript = { "biome", "prettier", stop_after_first = true },
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
		biome = { require_cwd = true },
		prettier = { require_cwd = true },
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
		end
})
