let g:ale_hover_to_floating_preview=1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

let js_fixers = ['prettier', 'eslint']

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': js_fixers,
\   'javascript.jsx': js_fixers,
\   'typescript': js_fixers,
\   'typescriptreact': js_fixers,
\   'css': ['prettier'],
\   'json': ['prettier'],
\}
