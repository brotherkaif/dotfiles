local wk = require('which-key')

wk.setup()

wk.register({
	-- # GOTO
	['g'] = {
		name = 'GO TO',
		D = {'LSP: declaration'}, -- LSP
		d = {'LSP: definition'}, -- LSP
		i = {'LSP: implementations'}, -- LSP
		r = {'LSP: references'}, -- LSP
	},

	-- # LSP
	['<space>e'] = {'LSP: diagnostic hover'}, -- LSP
	['<space>q'] = {'LSP: diagnostic set local list'}, -- LSP
	['K'] = {'LSP: display hover information'}, -- LSP
	['<C-k>'] = {'LSP: display signature information'}, -- LSP
	['<space>wa'] = {'LSP: add workspace folder'},
	['<space>wr'] = {'LSP: remove workspace folder'},
	['<space>wl'] = {'LSP: list workspace folders'},
	['<space>D'] = {'LSP: type definition'}, -- LSP
	['<space>rn'] = {'LSP: rename'}, -- LSP
	['<space>ca'] = {'LSP: code action'}, -- LSP
	['<space>f'] = {'LSP: format buffer'}, -- LSP

	-- # LEADER BINDS
	['<leader>'] = {
		-- # LEADER BINDS
		name = 'LEADER BINDS',
		[';'] = {'telescope command pallette'},
		t = {'open terminal'},

		-- # PREVIOUS
		['p'] = {
			name = 'PREVIOUS',
			b = {'buffer'},
			q = {'quick fix'},
			d = {'LSP: diagnostic'}, -- LSP
		},

		-- # NEXT
		['n'] = {
			name = 'NEXT',
			b = {'buffer'},
			q = {'quick fix'},
			d = {'LSP: diagnostic'}, -- LSP
		},


		-- CURSOR MOVEMENT = `h` + `j` + `k` + `l`
		h = {'cursor left'},
		j = {'cursor down'},
		k = {'cursor up'},
		l = {'cursor right'},

		-- WINDOW MOVEMENT = `H` + `J` + `K` + `L`
		H = {'window left'},
		J = {'window down'},
		K = {'window up'},
		L = {'window right'},

		-- WINDOW RESIZE = `UP` + `DOWN` + `LEFT` + `RIGHT`
		['<Up>'] = {'increase vertical size'},
		['<Down>'] = {'decrease vertical size'},
		['<Left>'] = {'decrease horizontal size'},
		['<Right>'] = {'increase horizontal size'},

		-- # GROUPED BINDS
		-- BUFFERS = `b`
		b = {
			name = 'BUFFERS',
			w = {'write buffer'},
			r = {'reload buffer'},
			z = {'toggle zen mode'},
			m = {'maximise buffer window'},
			e = {'equalise buffer windows'},
			x = {'split horizontal'},
			v = {'split vertical'},
			q = {'quit buffer'},
			o = {'close other buffer windows'},
			f = {'format buffer'},
			s = {'toggle spellcheck'},
			['/'] = {'grep buffer'},
		},

		-- FILES = `f`
		f = {
			name = 'FILES',
			f = {'find file'},
			g = {'find git file'},
			b = {'file browser (project directory)'},
			d = {'file browser (current directory)'},
			['/'] = {'grep files'},
		},

		-- GIT = `g`
		g = {
			name = 'GIT',
			s = {'status'},
			c = {'commit'},
		},

		-- INTERFACE = `i`
		i = {
			name = 'INTERFACE',
			l = {'set light theme'},
			d = {'set dark theme'},
			n = {'toggle relative line numbers'},
			c = {'toggle character display'},
		},

		-- WORKSPACE = `w`
		w = {
			name = 'WORKSPACE',
		},
	},
})
