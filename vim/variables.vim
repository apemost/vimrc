let g:custom_leader =
      \ get(g:, 'custom_leader', ' ')
let g:custom_localleader =
      \ get(g:, 'custom_localleader', ',')
let g:custom_background =
      \ get(g:, 'custom_background', 'dark')
if !exists('g:custom_colorscheme')
  let s:colorscheme_paths = &runtimepath
  " vim-plug adds plugin directories to runtimepath later during startup.
  if index(get(g:, 'custom_disabled_plugins', []), 'gruvbox', 0, 1) < 0
    let s:plug_home = get(g:, 'plug_home', split(&runtimepath, ',')[0] . '/plugged')
    let s:colorscheme_paths .= ',' . escape(s:plug_home . '/gruvbox', ',')
  endif
  let g:custom_colorscheme = empty(globpath(s:colorscheme_paths, 'colors/gruvbox.vim', 1))
        \ ? 'molokai' : 'gruvbox'
endif
let g:custom_colorcolumn =
      \ get(g:, 'custom_colorcolumn', 0)
let g:custom_guifont =
      \ get(g:, 'custom_guifont', 'Hack:h13,Monaco:h13')
let g:custom_powerline_fonts =
      \ get(g:, 'custom_powerline_fonts', 1)
let g:custom_plugins =
      \ get(g:, 'custom_plugins', [])
let g:custom_disabled_plugins =
      \ get(g:, 'custom_disabled_plugins', [])
let g:custom_completion_plugin =
      \ get(g:, 'custom_completion_plugin', '')
let g:custom_lint_plugin =
      \ get(g:, 'custom_lint_plugin', '')
let g:custom_ycm_install_options =
      \ get(g:, 'custom_ycm_install_options', '--clangd-completer')
let g:custom_search_engine =
      \ get(g:, 'custom_search_engine', 'https://www.google.com/search?q=%s')
let g:custom_error_symbol =
      \ get(g:, 'custom_error_symbol', '×')
let g:custom_warning_symbol =
      \ get(g:, 'custom_warning_symbol', '¤')
