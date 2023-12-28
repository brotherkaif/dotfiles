return {
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	'lewis6991/gitsigns.nvim',
	opts = {
		-- See `:help gitsigns.txt`
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map({ 'n', 'v' }, ']c', function()
				if vim.wo.diff then
					return ']c'
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return '<Ignore>'
			end, { expr = true, desc = 'NEXT [c]hange' })

			map({ 'n', 'v' }, '[c', function()
				if vim.wo.diff then
					return '[c'
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return '<Ignore>'
			end, { expr = true, desc = 'PREV [c]hange' })

			-- Actions
			-- visual mode
			map('v', '<leader>hs', function()
				gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'stage git hunk' })
			map('v', '<leader>hr', function()
				gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'reset git hunk' })
			-- normal mode
			map('n', '<leader>hs', gs.stage_hunk, { desc = 'git [h]unk [s]tage' })
			map('n', '<leader>hr', gs.reset_hunk, { desc = 'git [h]unk [r]eset ' })
			map('n', '<leader>hS', gs.stage_buffer, { desc = 'git [h]unk [S]tage buffer' })
			map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'git [h]unk [u]ndo stage' })
			map('n', '<leader>hR', gs.reset_buffer, { desc = 'git [h]unk [R]eset buffer' })
			map('n', '<leader>hp', gs.preview_hunk, { desc = 'git [h]unk [p]review ' })
			map('n', '<leader>hb', function()
				gs.blame_line { full = false }
			end, { desc = 'git [h]unk [b]lame' })
			map('n', '<leader>hd', gs.diffthis, { desc = 'git [h]unk [d]iff (index)' })
			map('n', '<leader>hD', function()
				gs.diffthis '~'
			end, { desc = 'git [h]unk [D]iff (commit)' })

			-- Toggles
			map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[t]oggle git [b]lame line' })
			map('n', '<leader>td', gs.toggle_deleted, { desc = '[t]oggle git show [d]eleted' })

			-- Text object
			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
		end,
	},
}
