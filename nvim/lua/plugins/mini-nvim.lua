return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		local starter_config = {
			header = table.concat({
				[[          /\ \▔\___  ___/\   /(●)_ __ ___          ]],
				[[         /  \/ / _ \/ _ \ \ / / | '_ ` _ \         ]],
				[[        / /\  /  __/ (_) \ V /| | | | | | |        ]],
				[[        \_\ \/ \___|\___/ \_/ |_|_| |_| |_|        ]],
				[[───────────────────────────────────────────────────]],
			}, "\n"),
			items = {
				require("mini.starter").sections.telescope(),
				require("mini.starter").sections.recent_files(5, false, false),
				require("mini.starter").sections.sessions(),
				require("mini.starter").sections.builtin_actions(),
			},
			footer = os.date(),
		}

		local map_config = {
			integrations = {
				require("mini.map").gen_integration.builtin_search(),
				require("mini.map").gen_integration.diagnostic({
					error = "DiagnosticFloatingError",
					warn = "DiagnosticFloatingWarn",
					info = "DiagnosticFloatingInfo",
					hint = "DiagnosticFloatingHint",
				}),
				require("mini.map").gen_integration.gitsigns(),
			},
			symbols = {
				encode = require("mini.map").gen_encode_symbols.dot("4x2"),
			},
			window = {
				focusable = true,
				side = "right",
				winblend = 50,
				show_integration_count = false,
			},
		}

		-- require("mini.ai").setup()
		require("mini.align").setup()
		require("mini.animate").setup()
		-- require("mini.base16").setup()
		require("mini.basics").setup()
		require("mini.bracketed").setup()
		require("mini.bufremove").setup()
		-- require("mini.colors").setup()
		require("mini.comment").setup()
		require("mini.completion").setup()
		require("mini.cursorword").setup()
		-- require("mini.doc").setup()
		-- require("mini.fuzzy").setup()
		require("mini.indentscope").setup()
		require("mini.jump").setup()
		require("mini.jump2d").setup()
		require("mini.map").setup(map_config)
		-- require("mini.misc").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.sessions").setup()
		require("mini.splitjoin").setup()
		require("mini.starter").setup(starter_config)
		require("mini.statusline").setup()
		require("mini.surround").setup()
		require("mini.tabline").setup()
		-- require("mini.test").setup()
		require("mini.trailspace").setup()
	end,
}
