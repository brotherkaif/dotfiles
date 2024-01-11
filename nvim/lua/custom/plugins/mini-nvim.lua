return {
	"echasnovski/mini.nvim",
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		local animate_config = function()
			-- don't use animate when scrolling with the mouse
			local mouse_scrolled = false
			for _, scroll in ipairs({ "Up", "Down" }) do
				local key = "<ScrollWheel" .. scroll .. ">"
				vim.keymap.set({ "", "i" }, key, function()
					mouse_scrolled = true
					return key
				end, { expr = true })
			end

			local animate = require("mini.animate")
			return {
				resize = {
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
					subscroll = animate.gen_subscroll.equal({
						predicate = function(total_scroll)
							if mouse_scrolled then
								mouse_scrolled = false
								return false
							end
							return total_scroll > 1
						end,
					}),
				},
			}
		end

		local basics_config = {
			options = {
				basic = true,
				extra_ui = true,
				win_borders = 'default',
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
		}

		local clue_config = function()
			local miniclue = require('mini.clue')

			local opts = {
				triggers = {
					-- Leader triggers
					{ mode = 'n', keys = '<Leader>' },
					{ mode = 'x', keys = '<Leader>' },

					-- Built-in completion
					{ mode = 'i', keys = '<C-x>' },

					-- `g` key
					{ mode = 'n', keys = 'g' },
					{ mode = 'x', keys = 'g' },

					-- Marks
					{ mode = 'n', keys = "'" },
					{ mode = 'n', keys = '`' },
					{ mode = 'x', keys = "'" },
					{ mode = 'x', keys = '`' },

					-- Registers
					{ mode = 'n', keys = '"' },
					{ mode = 'x', keys = '"' },
					{ mode = 'i', keys = '<C-r>' },
					{ mode = 'c', keys = '<C-r>' },

					-- Window commands
					{ mode = 'n', keys = '<C-w>' },

					-- `z` key
					{ mode = 'n', keys = 'z' },
					{ mode = 'x', keys = 'z' },

					-- Toggles
					{ mode = 'n', keys = [[\]] },

					-- Brackets
					{ mode = 'n', keys = '[' },
					{ mode = 'n', keys = ']' },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			}

			return opts
		end

		local files_config = {
			windows = {
				preview = true,
				width_focus = 30,
				width_preview = 60,
			},
			options = {
				use_as_default_explorer = true,
				show_dotfiles = true,
			},
		}

		local hipatterns_config = {
			highlighters = {
				fixme = { pattern = 'FIXME:', group = 'MiniHipatternsFixme' },
				hack  = { pattern = 'HACK:', group = 'MiniHipatternsHack' },
				todo  = { pattern = 'TODO:', group = 'MiniHipatternsTodo' },
				note  = { pattern = 'NOTE:', group = 'MiniHipatternsNote' },
			}
		}

		local starter_config = {
			header = table.concat({
				[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
				[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
				[[/ /\  /  __/ (_) \ V /| | | | | | |]],
				[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
				[[───────────────────────────────────]],
			}, "\n"),
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

		require("mini.ai").setup()
		-- require("mini.align").setup()
		require("mini.animate").setup(animate_config())
		-- require("mini.base16").setup()
		require("mini.basics").setup(basics_config)
		require("mini.bracketed").setup()
		require("mini.bufremove").setup()
		require("mini.clue").setup(clue_config())
		-- require("mini.colors").setup()
		require("mini.comment").setup()
		require("mini.completion").setup()
		require("mini.cursorword").setup()
		-- require("mini.doc").setup()
		require("mini.extra").setup()
		require("mini.files").setup(files_config)
		-- require("mini.fuzzy").setup()
		require("mini.hipatterns").setup(hipatterns_config)
		-- require("mini.hues").setup()
		require("mini.indentscope").setup()
		require("mini.jump").setup()
		require("mini.jump2d").setup()
		-- require("mini.map").setup()
		-- require("mini.misc").setup()
		require("mini.move").setup()
		-- require("mini.operators").setup()
		require("mini.pairs").setup()
		require("mini.pick").setup()
		-- require("mini.sessions").setup()
		-- require("mini.splitjoin").setup()
		require("mini.starter").setup(starter_config)
		require("mini.statusline").setup()
		require("mini.surround").setup()
		require("mini.tabline").setup()
		-- require("mini.test").setup()
		require("mini.trailspace").setup()
		-- require("mini.visits").setup()
	end,

	keys = {
		{
			'-',
			function()
				require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
			end,
			desc = 'File Navigation (file)',
		},
		{
			'_',
			function() require('mini.files').open(vim.loop.cwd(), true) end,
			desc = 'File Navigation (cwd)',
		},
		{ '<leader>cc',      function() vim.cmd('colorscheme randomhue') end,         desc = '[c]olors[c]heme randomhue' },
		{ '<leader>cd',      function() vim.cmd('colorscheme default') end,           desc = '[c]olorscheme [d]efault' },
		{ '<leader><space>', function() require('mini.pick').builtin.buffers() end,   desc = 'find buffer' },
		{ '<leader>ff',      function() require('mini.pick').builtin.files() end,     desc = '[f]ind [f]ile' },
		{ '<leader>fh',      function() require('mini.pick').builtin.help() end,      desc = '[f]ind [h]elp' },
		{ '<leader>fg',      function() require('mini.pick').builtin.grep_live() end, desc = '[f]ind with [g]rep' },
		{ '<leader>fm',      function() require('mini.extra').pickers.marks() end,    desc = '[f]ind [m]arks' },
		{ '<leader>fe',      function() require('mini.extra').pickers.explorer() end,    desc = '[f]ind in [e]xplorer' },
		{ '<leader>fd',      function() require('mini.extra').pickers.diagnostic() end,    desc = '[f]ind [d]iagnostic' },
		{ '<leader>fp',      function() require('mini.extra').pickers.commands() end,    desc = '[f]ind command [p]alette' },
		{ '<leader>f/',      function() require('mini.extra').pickers.buf_lines() end,    desc = '[f]ind in buffer' },
	},
}
