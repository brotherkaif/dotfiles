local cmp = require('cmp')
something = {}

vim.api.nvim_set_keymap('i', '<C-k>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>']], {expr = true, noremap = false})
vim.api.nvim_set_keymap('s', '<C-k>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>']], {expr = true, noremap = false})

cmp.setup({
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

	sources = {
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer', keyword_length = 5 },
		{ name = 'vsnip' },
		{ name = 'path' },
		{ name = 'spell' },
	},

	snippet = {
		expand = function(args)
		vim.fn["vsnip#anonymous"](args.body)
		end
	},

	view = {
		entries = 'native',
	},

	experimental = {
		ghost_text = true,
	},
})
