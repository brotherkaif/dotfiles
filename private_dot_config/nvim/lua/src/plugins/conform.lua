MiniDeps.add("stevearc/conform.nvim")

local supported_types = {
	"astro",
	"css",
	"graphql",
	"handlebars",
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"jsonc",
	"less",
	"markdown",
	"markdown.mdx",
	"scss",
	"svelte",
	"typescript",
	"typescriptreact",
	"vue",
	"yaml",
}

local opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.lua = { "stylua" }

      for _, ft in ipairs(supported_types) do
        opts.formatters_by_ft[ft] = { "biome", "prettier", stop_after_first = true }
      end

      opts.formatters = opts.formatters or {}

      opts.formatters.biome = {
        require_cwd = true,
      }
      opts.formatters.prettier = {
        require_cwd = true,
      }

      opts.format_on_save = function(bufnr)
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
    end

require("conform").setup(opts)
