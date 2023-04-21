local M = {}

function M.SetHighlights()
	local commands = {
		-- make the sign column transparent
		'highlight clear SignColumn',

		-- change cursorline highlight
		'highlight clear CursorLine',

		-- 'highlight CursorLine ctermbg=Black guibg=Black',
		'highlight CursorLine cterm=underline guibg=underline',

		-- make folds transparent
		'highlight clear Folded',

		-- make the split line transparent
		'highlight clear VertSplit',

		-- list characters styling
		'highlight SpecialKey ctermfg=DarkGrey guifg=DarkGrey',

		-- list characters styling
		'highlight NonText ctermfg=DarkGrey guifg=DarkGrey',

		-- popup menu styling
		'highlight Pmenu ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey',

		-- popup menu styling
		'highlight PmenuSel ctermbg=Grey guibg=Grey ctermfg=Black guifg=Black',

		-- popup menu styling
		'highlight PmenuSbar ctermbg=Black guibg=Black',

		-- popup menu styling
		'highlight PmenuThumb ctermbg=Grey guibg=Grey',

		-- Twilight styling
		'highlight Twilight ctermfg=8',

		-- lsp styling
		-- 'highlight LspDiagnosticsFloating ctermbg=Black guibg=Black',

		-- lsp styling
		-- 'highlight LspDiagnosticsVirtualTextError ctermfg=Red guifg=Red',

		-- lsp styling
		-- 'highlight LspDiagnosticsVirtualTextWarning ctermfg=Yellow guifg=Yellow',

		-- lsp styling
		-- 'highlight LspDiagnosticsVirtualTextHint ctermfg=Blue guifg=Blue',

		-- lsp styling
		-- 'highlight LspDiagnosticsVirtualTextInformation ctermfg=DarkGrey guifg=DarkGrey',

		-- lsp styling
		-- 'highlight LspDiagnosticsUnderlineError ctermfg=none guifg=none cterm=underline gui=underline',

		-- lsp styling
		-- 'highlight LspDiagnosticsUnderlineWarning ctermfg=none guifg=none cterm=underline gui=underline',

		-- lsp styling
		-- 'highlight LspDiagnosticsUnderlineInformation ctermfg=none guifg=none cterm=underline gui=underline',

		-- lsp styling
		-- 'highlight LspDiagnosticsUnderlineHint ctermfg=none guifg=none cterm=underline gui=underline',
	}

	-- -- execute commands
	for _, command in ipairs(commands) do
		vim.cmd(command)
	end
end

return M
