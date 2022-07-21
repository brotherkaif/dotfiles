let g:copilot_no_tab_map = v:true

imap <silent> <C-h> <Plug>(copilot-previous)
imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
imap <silent> <C-k> <Plug>(copilot-dismiss)
imap <silent> <C-l> <Plug>(copilot-next)
