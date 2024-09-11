_G.Config.leader_group_clues = {
	{ mode = "n", keys = "<Leader>b", desc = "+Buffer" },
	{ mode = "n", keys = "<Leader>e", desc = "+Explore" },
	{ mode = "n", keys = "<Leader>f", desc = "+Find" },
	{ mode = "n", keys = "<Leader>g", desc = "+Git" },
	{ mode = "n", keys = "<Leader>l", desc = "+LSP" },
	{ mode = "x", keys = "<Leader>l", desc = "+LSP" },
	{ mode = "n", keys = "<Leader>m", desc = "+Map" },
	-- { mode = 'n', keys = '<Leader>t', desc = '+Terminal/Minitest' },
	-- { mode = 'n', keys = '<Leader>T', desc = '+Test' },
	-- { mode = 'n', keys = '<Leader>v', desc = '+Visits' },
}

local nmap = function(mapping, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set("n", mapping, rhs, opts)
end

-- Create `<Leader>` mappings
local nmap_leader = function(suffix, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, opts)
end

local xmap_leader = function(suffix, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set("x", "<Leader>" .. suffix, rhs, opts)
end

-- b is for 'buffer'
nmap("=", "<Cmd>colorscheme randomhue<CR>", "colorscheme randomhue")
nmap("+", "<Cmd>colorscheme default<CR>", "colorscheme default")

-- b is for 'buffer'
nmap_leader("ba", "<Cmd>b#<CR>", "[b]uffer [a]lternate")
nmap_leader("bd", "<Cmd>lua MiniBufremove.delete()<CR>", "[b]uffer [d]elete")
nmap_leader("bD", "<Cmd>lua MiniBufremove.delete(0, true)<CR>", "[b]uffer [D]elete (FORCE!)")
nmap_leader("bs", "<Cmd>lua Config.new_scratch_buffer()<CR>", "[b]uffer [s]cratch")
nmap_leader("bw", "<Cmd>lua MiniBufremove.wipeout()<CR>", "[b]uffer [w]ipeout")
nmap_leader("bW", "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>", "[b]uffer [W]ipeout (FORCE!)")

-- e is for 'explore'
nmap_leader("ec", '<Cmd>lua MiniFiles.open(vim.fn.stdpath("config"))<CR>', "[e]xplore [c]onfig")
nmap_leader("ed", "<Cmd>lua MiniFiles.open()<CR>", "[e]xplore [d]irectory")
nmap_leader("ef", "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", "[e]xplore [f]ile directory")
nmap_leader("eq", "<Cmd>lua Config.toggle_quickfix()<CR>", "[e]xplore [q]uickfix")

-- f is for 'fuzzy find'
nmap_leader("f/", '<Cmd>Pick history scope="/"<CR>', "[f]ind [/] history")
nmap_leader("f:", '<Cmd>Pick history scope=":"<CR>', "[f]ind [:] history")
nmap_leader("f'", "<Cmd>Pick marks<CR>", "[f]ind ['] marks")
nmap_leader("fa", '<Cmd>Pick git_hunks scope="staged"<CR>', "[f]ind [a]dded hunks (all)")
nmap_leader("fA", '<Cmd>Pick git_hunks path="%" scope="staged"<CR>', "[f]ind [A]dded hunks (current)")
nmap_leader("fb", "<Cmd>Pick buffers<CR>", "[f]ind [b]uffers")
nmap_leader("fc", "<Cmd>Pick git_commits<CR>", "[f]ind [c]ommits (all)")
nmap_leader("fC", '<Cmd>Pick git_commits path="%"<CR>', "[f]ind [C]ommits (current)")
nmap_leader("fd", '<Cmd>Pick diagnostic scope="all"<CR>', "[f]ind [d]iagnostic (workspace)")
nmap_leader("fD", '<Cmd>Pick diagnostic scope="current"<CR>', "[f]ind [D]iagnostic (buffer)")
nmap_leader("ff", "<Cmd>Pick explorer<CR>", "[f]ind in [e]xplorer")
nmap_leader("ff", "<Cmd>Pick files<CR>", "[f]ind [f]ile")
nmap_leader("fg", "<Cmd>Pick grep_live<CR>", "[f]ind with [g]rep (interactive)")
nmap_leader("fG", '<Cmd>Pick grep pattern="<cword>"<CR>', "[f]ind with [G]rep (current word)")
nmap_leader("fh", "<Cmd>Pick help<CR>", "[f]ind [h]elp")
nmap_leader("fH", "<Cmd>Pick hl_groups<CR>", "[f]ind [H]ighlight groups")
nmap_leader("fl", '<Cmd>Pick buf_lines scope="all"<CR>', "[f]ind [l]ines (all)")
nmap_leader("fL", '<Cmd>Pick buf_lines scope="current"<CR>', "[f]ind [L]ines (current)")
nmap_leader("fm", "<Cmd>Pick git_hunks<CR>", "[f]ind [m]odified hunks (all)")
nmap_leader("fM", '<Cmd>Pick git_hunks path="%"<CR>', "[f]ind [M]odified hunks (current)")
nmap_leader("fR", "<Cmd>Pick resume<CR>", "[f]ind [R]esume")
nmap_leader("fr", '<Cmd>Pick lsp scope="references"<CR>', "[f]ind LSP [r]eferences")
nmap_leader("fs", '<Cmd>Pick lsp scope="workspace_symbol"<CR>', "[f]ind LSP [s]ymbols (workspace)")
nmap_leader("fS", '<Cmd>Pick lsp scope="document_symbol"<CR>', "[f]ind LSP [S]ymbols (buffer)")
nmap_leader("fv", '<Cmd>Pick visit_paths cwd=""<CR>', "[f]ind [v]isits paths (all)")
nmap_leader("fV", "<Cmd>Pick visit_paths<CR>", "[f]ind [V]isits paths (cwd)")

-- g is for git
nmap_leader("gg", "<Cmd>lua Config.open_lazygit()<CR>", "[g]it mana[g]er")
-- nmap_leader('go', '<Cmd>lua MiniDiff.toggle_overlay()<CR>', '[g]it [o]verlay toggle')
-- nmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>',  'Show at cursor')
-- xmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>',  'Show at selection')

-- l is for 'LSP' (Language Server Protocol)
local formatting_cmd = '<Cmd>lua require("conform").format({ lsp_fallback = true })<CR>'
nmap_leader("la", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "[l]SP [a]rguments popup")
nmap_leader("lA", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "[l]SP code [A]ction")
nmap_leader("ld", "<Cmd>lua vim.diagnostic.open_float()<CR>", "[l]SP [d]iagnostics popup")
nmap_leader("li", "<Cmd>lua vim.lsp.buf.hover()<CR>", "[l]SP [i]nformation")
nmap_leader("lj", "<Cmd>lua vim.diagnostic.goto_next()<CR>", "[l]SP [j] next diagnostic")
nmap_leader("lk", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", "[l]SP [k] prev diagnostic")
nmap_leader("lR", "<Cmd>lua vim.lsp.buf.rename()<CR>", "[l]SP [R]ename")
nmap_leader("lr", "<Cmd>lua vim.lsp.buf.references()<CR>", "[l]SP [r]eferences")
nmap_leader("ls", "<Cmd>lua vim.lsp.buf.definition()<CR>", "[l]SP [s]ource definition")
nmap_leader("lf", formatting_cmd, "[l]SP [f]ormat")
xmap_leader("lf", formatting_cmd, "[l]SP [f]ormat selection")

-- m is for 'map'
nmap_leader("mc", "<Cmd>lua MiniMap.close()<CR>", "[m]ap [c]lose")
nmap_leader("mf", "<Cmd>lua MiniMap.toggle_focus()<CR>", "[m]ap [f]ocus (toggle)")
nmap_leader("mo", "<Cmd>lua MiniMap.open()<CR>", "[m]ap [o]pen")
nmap_leader("mr", "<Cmd>lua MiniMap.refresh()<CR>", "[m]ap [r]efresh")
nmap_leader("ms", "<Cmd>lua MiniMap.toggle_side()<CR>", "[m]ap [s]ide (toggle)")
nmap_leader("mt", "<Cmd>lua MiniMap.toggle()<CR>", "[m]ap [t]oggle")

-- t is for 'terminal' (uses 'neoterm') and 'minitest'
-- nmap_leader('ta', '<Cmd>lua MiniTest.run()<CR>',                       'Test run all')
-- nmap_leader('tf', '<Cmd>lua MiniTest.run_file()<CR>',                  'Test run file')
-- nmap_leader('tl', '<Cmd>lua MiniTest.run_at_location()<CR>',           'Test run location')
-- nmap_leader('ts', '<Cmd>lua Config.minitest_screenshots.browse()<CR>', 'Test show screenshot')
-- nmap_leader('tT', '<Cmd>belowright Tnew<CR>',                          'Terminal (horizontal)')
-- nmap_leader('tt', '<Cmd>vertical Tnew<CR>',                            'Terminal (vertical)')

-- T is for 'test'
-- nmap_leader('TF', '<Cmd>TestFile -strategy=make | copen<CR>',    'File (quickfix)')
-- nmap_leader('Tf', '<Cmd>TestFile<CR>',                           'File')
-- nmap_leader('TL', '<Cmd>TestLast -strategy=make | copen<CR>',    'Last (quickfix)')
-- nmap_leader('Tl', '<Cmd>TestLast<CR>',                           'Last')
-- nmap_leader('TN', '<Cmd>TestNearest -strategy=make | copen<CR>', 'Nearest (quickfix)')
-- nmap_leader('Tn', '<Cmd>TestNearest<CR>',                        'Nearest')
-- nmap_leader('TS', '<Cmd>TestSuite -strategy=make | copen<CR>',   'Suite (quickfix)')
-- nmap_leader('Ts', '<Cmd>TestSuite<CR>',                          'Suite')

-- v is for 'visits'
-- nmap_leader('vv', '<Cmd>lua MiniVisits.add_label("core")<CR>',    'Add "core" label')
-- nmap_leader('vV', '<Cmd>lua MiniVisits.remove_label("core")<CR>', 'Remove "core" label')
-- nmap_leader('vl', '<Cmd>lua MiniVisits.add_label()<CR>',          'Add label')
-- nmap_leader('vL', '<Cmd>lua MiniVisits.remove_label()<CR>',       'Remove label')
