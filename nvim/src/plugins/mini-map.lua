require('mini.map').setup({
	integrations = {
		require('mini.map').gen_integration.builtin_search(),
		require('mini.map').gen_integration.diagnostic({
			error = 'DiagnosticFloatingError',
			warn  = 'DiagnosticFloatingWarn',
			info  = 'DiagnosticFloatingInfo',
			hint  = 'DiagnosticFloatingHint',
		}),
		require('mini.map').gen_integration.gitsigns(),
	},
	symbols = {
		encode = require('mini.map').gen_encode_symbols.dot('3x2'),
	},
})
