"*********************************************************************
" https://github.com/dense-analysis/ale
"*********************************************************************

let g:ale_sign_error = get(g:, 'ale_sign_error', g:custom_error_symbol)
let g:ale_sign_warning = get(g:, 'ale_sign_warning', g:custom_warning_symbol)
let g:ale_lint_on_text_changed = get(g:, 'ale_lint_on_text_changed', 'never')
let g:ale_lint_on_enter = get(g:, 'ale_lint_on_enter', 0)
let g:ale_pattern_options = get(g:, 'ale_pattern_options', {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \ })

Plug 'dense-analysis/ale'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-l> <Plug>(ale_lint)

nmap <silent> ]a <Plug>(ale_previous_wrap)
nmap <silent> [a <Plug>(ale_next_wrap)
