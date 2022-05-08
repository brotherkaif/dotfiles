set laststatus=2
set statusline=
set statusline+=%4*
set statusline+=%{StatuslineMode()}
set statusline+=%9*
set statusline+=\ 
set statusline+=<
set statusline+=%n
set statusline+=>
set statusline+=\ 
set statusline+=%f
set statusline+=%=
set statusline+=%m
set statusline+=%h
set statusline+=%r
set statusline+=\ 
set statusline+=%2*
set statusline+=%F
set statusline+=\ 
set statusline+=%3*
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=\ 
set statusline+=%c
set statusline+=\ 
set statusline+=%9*
set statusline+=%y
hi User4 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User9 ctermbg=black ctermfg=white guibg=black guifg=white
hi User2 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi User3 ctermbg=black ctermfg=magenta guibg=black guifg=magenta

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction
