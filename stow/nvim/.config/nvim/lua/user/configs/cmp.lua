local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

vim.api.nvim_set_keymap('i', '<C-k>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>']], {expr = true, noremap = false})
vim.api.nvim_set_keymap('s', '<C-k>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>']], {expr = true, noremap = false})

cmp.setup({
	snippet = {
		expand = function(args)
		vim.fn["vsnip#anonymous"](args.body)
		end
	},

	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.close(),
		['<C-y>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		['<C-Space>'] = cmp.mapping.complete(),
	},

	formatting = {
		fields = { "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				vsnip = "[SNIP]",
				nvim_lua = "[NVIM]",
				buffer = "[BUFF]",
				path = "[PATH]",
				spell = "[SPELL]",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'nvim_lua' },
		{ name = 'buffer', keyword_length = 5 },
		{ name = 'path' },
		{ name = 'spell' },
	},

	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},

	-- window = {
	-- 	documentation = 'native',
	-- },

	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})
