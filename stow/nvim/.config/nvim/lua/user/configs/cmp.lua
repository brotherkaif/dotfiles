local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
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
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'spell' },
	},

	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},

	view = {
		entries = 'native',
	},

	experimental = {
		ghost_text = true,
	},
})
