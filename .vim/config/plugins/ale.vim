"*********************************************************************
" w0rp/ale
"*********************************************************************

if HasFeatures() && get(g:, 'custom_lint_plugin', '') == 'ale'
  Plug 'w0rp/ale'

  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'python': ['pylint'],
        \   'typescript': ['tslint'],
        \ }
  let g:ale_pattern_options = {
        \   '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
        \   '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
        \ }

  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  nmap <silent> <C-l> <Plug>(ale_lint)
endif
