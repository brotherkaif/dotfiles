-- require('custom.config.init')
-- require('custom.autocmds.init')

-- INIT =============================================================
pcall(function() vim.loader.enable() end)

-- Define main config table
_G.Config = {
	path_package = vim.fn.stdpath('data') .. '/site/',
	path_source = vim.fn.stdpath('config') .. '/src/',
}

-- Ensure 'mini.nvim' is set up
local mini_path = Config.path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
	vim.cmd([[echo "Installing 'mini.nvim'" | redraw]])
	local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
	vim.fn.system(clone_cmd)
end

require('mini.deps').setup({ path = { package = Config.path_package } })

-- Define helpers
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local source = function(path) dofile(Config.path_source .. path) end

-- SETTINGS AND MAPPINGS ======================================================
now(function() source('settings.lua') end)
now(function() source('mappings.lua') end)
now(function() source('functions.lua') end)
-- now(function() source('mappings-leader.lua') end)
-- if vim.g.vscode ~= nil then now(function() source('vscode.lua') end) end

-- Mini.nvim ==================================================================
add({ name = 'mini.nvim', checkout = 'HEAD' })

-- PRIORITY
now(function() require('mini.notify').setup() end)
now(function() require('mini.sessions').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.tabline').setup() end)

now(function()
	require('mini.starter').setup({
		header = table.concat({
			[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
			[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
			[[/ /\  /  __/ (_) \ V /| | | | | | |]],
			[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
			[[───────────────────────────────────]],
		}, '\n'),
		footer = os.date(),
	})
end)

now(function()
	require('mini.basics').setup({
		options = {
			basic = true,
			-- extra_ui is set to `false` and is instead set using the autocommand `mini-basics-extra-ui-workaround`
			extra_ui = false,
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
	})

	vim.api.nvim_create_autocmd('OptionSet', {
		pattern = 'termguicolors',
		callback = function()
			-- Set options only if 'termguicolors' is set
			if not vim.o.termguicolors then return end

			vim.o.pumblend = 10 -- Make builtin completion menus slightly transparent
			vim.o.pumheight = 10 -- Make popup menu smaller
			vim.o.winblend = 10 -- Make floating windows slightly transparent

			vim.o.listchars = 'tab:> ,extends:…,precedes:…,nbsp:␣' -- Define which helper symbols to show
			vim.o.list = true -- Show some helper symbols

			-- Enable syntax highlighting if it wasn't already (as it is time consuming)
			if vim.fn.exists('syntax_on') ~= 1 then vim.cmd([[syntax enable]]) end
		end,
	})
end)

now(function()
	add('f-person/auto-dark-mode.nvim')
	source('plugins/auto-dark-mode-nvim.lua')
end)

now(function() add('nvim-tree/nvim-web-devicons') end)

-- LAZY
later(function() require('mini.extra').setup() end)
later(function() require('mini.ai').setup() end)
later(function() require('mini.align').setup() end)
later(function() require('mini.bracketed').setup() end)
later(function() require('mini.bufremove').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.completion').setup() end)
later(function() require('mini.cursorword').setup() end)
later(function() require('mini.diff').setup() end)
later(function() require('mini.doc').setup() end)
later(function() require('mini.indentscope').setup() end)
later(function() require('mini.jump').setup() end)
later(function() require('mini.jump2d').setup() end)
later(function() require('mini.operators').setup() end)
later(function() require('mini.pick').setup() end)
later(function() require('mini.surround').setup() end)
later(function() require('mini.splitjoin').setup() end)
later(function() require('mini.trailspace').setup() end)
later(function() require('mini.visits').setup() end)
later(function() require('mini.pairs').setup() end)
-- later(function() require('mini.base16').setup() end)
-- later(function() require('mini.colors').setup() end)
-- later(function() require('mini.fuzzy').setup() end)
-- later(function() require('mini.hues').setup() end)
-- later(function() require('mini.misc').setup() end)
-- later(function() require('mini.test').setup() end)


later(function()
	local animate_config = function()
		-- don't use animate when scrolling with the mouse
		local mouse_scrolled = false
		for _, scroll in ipairs({ 'Up', 'Down' }) do
			local key = '<ScrollWheel' .. scroll .. '>'
			vim.keymap.set({ '', 'i' }, key, function()
				mouse_scrolled = true
				return key
			end, { expr = true })
		end

		local animate = require('mini.animate')
		return {
			resize = {
				timing = animate.gen_timing.linear({ duration = 100, unit = 'total' }),
			},
			scroll = {
				timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
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

	require('mini.animate').setup(animate_config())
end)

later(function()
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

	require('mini.clue').setup(clue_config())
end)

later(function()
	require('mini.files').setup({
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
end)

later(function()
	require('mini.hipatterns').setup({
		highlighters = {
			fixme = { pattern = 'FIXME:', group = 'MiniHipatternsFixme' },
			hack  = { pattern = 'HACK:', group = 'MiniHipatternsHack' },
			todo  = { pattern = 'TODO:', group = 'MiniHipatternsTodo' },
			note  = { pattern = 'NOTE:', group = 'MiniHipatternsNote' },
		}
	})
end)

later(function()
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
end)

later(function()
	require('mini.move').setup({
		options = {
			reindent_linewise = false
		}
	})
end)

later(function()
	add({
		source = 'neovim/nvim-lspconfig',
		depends = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim'
		},
	})
	source('plugins/nvim-lspconfig.lua')
end)

later(function()
	local ts_spec = {
		source = 'nvim-treesitter/nvim-treesitter',
		checkout = 'master',
		hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
	}
	add({ source = 'nvim-treesitter/nvim-treesitter-textobjects', depends = { ts_spec } })
	source('plugins/nvim-treesitter.lua')
end)

later(function()
	add('stevearc/conform.nvim')
	source('plugins/conform.lua')
end)

later(function()
	add('lewis6991/gitsigns.nvim')
	source('plugins/gitsigns.lua')
end)

-- TODO: finish keymaps
