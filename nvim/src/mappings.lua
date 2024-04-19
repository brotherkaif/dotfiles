-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>gg', '<Cmd>lua Config.open_lazygit()<CR>',                     { desc = '[g]it mana[g]er'})
vim.keymap.set('n', '<leader>go', '<Cmd>lua MiniDiff.toggle_overlay()<CR>',                 { desc = '[g]it [o]verlay'})

-- TODO: organise keymaps

vim.keymap.set('n', '-', function() require('mini.files').open(vim.api.nvim_buf_get_name(0), true) end,					{ desc = 'File Navigation (file)'})
vim.keymap.set('n', '_', function() require('mini.files').open(vim.loop.cwd(), true) end,					 { desc = 'File Navigation (cwd)' })
vim.keymap.set('n', '<leader>cc',      function() vim.cmd('colorscheme randomhue') end,            { desc = '[c]olors[c]heme randomhue' })
vim.keymap.set('n', '<leader>cd',      function() vim.cmd('colorscheme default') end,              { desc = '[c]olorscheme [d]efault' })
vim.keymap.set('n', '<leader><space>', function() require('mini.pick').builtin.buffers() end,      { desc = 'find buffer' })
vim.keymap.set('n', '<leader>ff',      function() require('mini.pick').builtin.files() end,        { desc = '[f]ind [f]ile' })
vim.keymap.set('n', '<leader>fh',      function() require('mini.pick').builtin.help() end,         { desc = '[f]ind [h]elp' })
vim.keymap.set('n', '<leader>fg',      function() require('mini.pick').builtin.grep_live() end,    { desc = '[f]ind with [g]rep' })
vim.keymap.set('n', '<leader>fm',      function() require('mini.extra').pickers.marks() end,       { desc = '[f]ind [m]arks' })
vim.keymap.set('n', '<leader>fe',      function() require('mini.extra').pickers.explorer() end,    { desc = '[f]ind in [e]xplorer' })
vim.keymap.set('n', '<leader>fd',      function() require('mini.extra').pickers.diagnostic() end,  { desc = '[f]ind [d]iagnostic' })
vim.keymap.set('n', '<leader>fc',      function() require('mini.extra').pickers.commands() end,    { desc = '[f]ind [c]ommand' })
vim.keymap.set('n', '<leader>fv',      function() require('mini.extra').pickers.visit_paths() end, { desc = '[f]ind recent [v]isits' })
vim.keymap.set('n', '<leader>f/',      function() require('mini.extra').pickers.buf_lines() end,   { desc = '[f]ind in buffer' })
vim.keymap.set('n', '<leader>p',       function() require('mini.extra').pickers.commands() end,    { desc = 'command [p]alette' })
vim.keymap.set('n', '<leader>mm',      function() require('mini.map').toggle() end,                { desc = '[m]ini [m]ap toggle' })
vim.keymap.set('n', '<leader>mo',      function() require('mini.map').open() end,                  { desc = 'mini [m]ap [o]pen' })
vim.keymap.set('n', '<leader>mc',      function() require('mini.map').close() end,                 { desc = 'mini [m]ap [c]lose' })
vim.keymap.set('n', '<leader>mf',      function() require('mini.map').toggle_focus() end,          { desc = 'mini [m]ap toggle [f]ocus' })
vim.keymap.set('n', '<leader>ms',      function() require('mini.map').toggle_side() end,           { desc = 'mini [m]ap toggle [s]ide' })
vim.keymap.set('n', '<leader>mr',      function() require('mini.map').refresh() end,               { desc = 'mini [m]ap [r]efresh' })
