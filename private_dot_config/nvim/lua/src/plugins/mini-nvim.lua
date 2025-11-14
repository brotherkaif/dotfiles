-- TEXT EDITING
require("mini.ai").setup()
require("mini.align").setup()
require("mini.comment").setup()
require("mini.completion").setup()
require("mini.keymap").setup()
require("mini.move").setup({
	options = {
		reindent_linewise = false,
	},
})
require("mini.operators").setup()
require("mini.pairs").setup()
require('mini.snippets').setup({
	snippets = {
		require('mini.snippets').gen_loader.from_lang(),
		mappings = {
			expand = '<C-j>',
			jump_next = '<C-l>',
			jump_prev = '<C-h>',
		},
	},
})

require("mini.surround").setup()

-- GENERAL WORKFLOW
require("mini.basics").setup({
	options = {
		basic = true,
		-- extra_ui is set to `false` and is instead set using the autocommand `mini-basics-extra-ui-workaround`
		extra_ui = false,
		win_borders = "default",
	},
	mappings = {
		basic = true,
		option_toggle_prefix = [[\]],
		windows = true,
		move_with_alt = true,
	},
	autocommands = {
		basic = true,
		relnum_in_visual_mode = true,
	},
	silent = false,
})
require("mini.bracketed").setup()
require("mini.bufremove").setup()
require("mini.clue").setup((function()
	local miniclue = require("mini.clue")

	local opts = {
		triggers = {
			-- Leader triggers
			{ mode = "n", keys = "<Leader>" },
			{ mode = "x", keys = "<Leader>" },

			-- Built-in completion
			{ mode = "i", keys = "<C-x>" },

			-- `g` key
			{ mode = "n", keys = "g" },
			{ mode = "x", keys = "g" },

			-- Marks
			{ mode = "n", keys = "'" },
			{ mode = "n", keys = "`" },
			{ mode = "x", keys = "'" },
			{ mode = "x", keys = "`" },

			-- Registers
			{ mode = "n", keys = '"' },
			{ mode = "x", keys = '"' },
			{ mode = "i", keys = "<C-r>" },
			{ mode = "c", keys = "<C-r>" },

			-- Window commands
			{ mode = "n", keys = "<C-w>" },

			-- `z` key
			{ mode = "n", keys = "z" },
			{ mode = "x", keys = "z" },

			-- Toggles
			{ mode = "n", keys = [[\]] },

			-- Brackets
			{ mode = "n", keys = "[" },
			{ mode = "n", keys = "]" },
		},

		clues = {
			-- Enhance this by adding descriptions for <Leader> mapping groups
			Config.leader_group_clues,
			miniclue.gen_clues.builtin_completion(),
			miniclue.gen_clues.g(),
			miniclue.gen_clues.marks(),
			miniclue.gen_clues.registers(),
			miniclue.gen_clues.windows({ submode_resize = true }),
			miniclue.gen_clues.z(),
		},
	}

	return opts
end)())
-- require("mini.deps").setup()
require("mini.diff").setup()
require("mini.extra").setup()
require("mini.files").setup({
	windows = {
		preview = true,
		width_focus = 30,
		width_preview = 60,
	},
	options = {
		use_as_default_explorer = true,
		show_dotfiles = true,
	},
})
require("mini.git").setup()
require("mini.jump").setup()
require("mini.jump2d").setup()
-- require("mini.misc").setup()
require("mini.pick").setup()
require("mini.sessions").setup()
require("mini.visits").setup()

-- APPEARANCE
require("mini.animate").setup()
-- require("mini.base16").setup()
-- require("mini.colors").setup()
require("mini.cursorword").setup()
require("mini.hipatterns").setup({
	highlighters = {
		fixme = { pattern = "FIXME:", group = "MiniHipatternsFixme" },
		hack = { pattern = "HACK:", group = "MiniHipatternsHack" },
		todo = { pattern = "TODO:", group = "MiniHipatternsTodo" },
		note = { pattern = "NOTE:", group = "MiniHipatternsNote" },
	},
})
-- require("mini.hues").setup()
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.map").setup({
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
		side = "right",
		width = 15,
		winblend = 25,
		focusable = false,
		show_integration_count = true,
	},
})
require("mini.notify").setup()
require("mini.starter").setup({
	header = table.concat({
		[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
		[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
		[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
		[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
		[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
		[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
		[[────────────────────────────────────────────────────]],
	}, "\n"),
	footer = os.date(),
})
require("mini.statusline").setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()

-- OTHER
-- require("mini.doc").setup()
-- require("mini.fuzzy").setup()
-- require("mini.test").setup()

-- HACK: used to add mini-files compatibility for non-truecolour compatible terminals (can be removed once macOS Tahoe releases)
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "termguicolors",
	callback = function()
		-- Set options only if 'termguicolors' is set
		if not vim.o.termguicolors then
			return
		end

		vim.o.pumblend = 10 -- Make builtin completion menus slightly transparent
		vim.o.pumheight = 10 -- Make popup menu smaller
		vim.o.winblend = 10 -- Make floating windows slightly transparent

		vim.o.listchars = "tab:> ,extends:…,precedes:…,nbsp:␣" -- Define which helper symbols to show
		vim.o.list = true -- Show some helper symbols

		-- Enable syntax highlighting if it wasn't already (as it is time consuming)
		if vim.fn.exists("syntax_on") ~= 1 then
			vim.cmd([[syntax enable]])
		end
	end,
})
