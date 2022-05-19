local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "»",
            server_pending = "*",
            server_uninstalled = "«"
        }
    }
})

-- Include the servers you want to have installed by default below
local servers = {
	"jsonls",
	"sumneko_lua",
	"tsserver",
	"bashls",
	"yamlls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.configs.lsp.handlers").on_attach,
		capabilities = require("user.configs.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("user.configs.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("user.configs.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
