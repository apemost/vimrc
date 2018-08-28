"*********************************************************************
" Plugins
"*********************************************************************

let s:vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(s:vim_plug_path)
  echo 'Installing vim-plug...'
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  execute 'source ' . fnameescape(s:vim_plug_path)
endif

let s:dirname = fnamemodify(expand('<sfile>'), ':h')
let s:builtin_plugins = [
      \   'airline',
      \   'asyncrun',
      \   'auto-pairs',
      \   'auto-save',
      \   'autoformat',
      \   'bbye',
      \   'cpp',
      \   'docker',
      \   'editorconfig',
      \   'emacscommandline',
      \   'emmet',
      \   'endwise',
      \   'fugitive',
      \   'fzf',
      \   'gitgutter',
      \   'gnupg',
      \   'go',
      \   'gruvbox',
      \   'is',
      \   'illuminate',
      \   'javascript',
      \   'jinja',
      \   'jsdoc',
      \   'json',
      \   'jump',
      \   'kotlin',
      \   'kronos',
      \   'markdown',
      \   'nerdcommenter',
      \   'nerdtree',
      \   'nginx',
      \   'pangu',
      \   'plantuml',
      \   'pydocstring',
      \   'rename',
      \   'repeat',
      \   'sneak',
      \   'surround',
      \   'tabular',
      \   'tagbar',
      \   'toml',
      \   'typescript',
      \   'undotree',
      \   'vimux',
      \   'vue',
      \ ]

if has('python3')
  call add(s:builtin_plugins, 'ultisnips')
endif

if !has('gui_running')
  call add(s:builtin_plugins, 'tmuxline')
endif

if HasFeatures()
  if !empty(g:custom_completion_plugin)
    call add(s:builtin_plugins, g:custom_completion_plugin)
  endif
  if !empty(g:custom_lint_plugin)
    call add(s:builtin_plugins, g:custom_lint_plugin)
  endif
endif

if !empty(g:custom_guide_plugin)
  call add(s:builtin_plugins, g:custom_guide_plugin)
endif

let s:enabled_builtin_plugins = []

function! s:check_plugins()
  for plugin in s:builtin_plugins
    let need_enable = 1
    for disabled in g:custom_disabled_plugins
      if plugin == disabled
        let need_enable = 0
        break
      endif
    endfor
    if need_enable
      call add(s:enabled_builtin_plugins, plugin)
    endif
  endfor
endfunction

function! s:load_builtin_plugins()
  for plugin in s:enabled_builtin_plugins
    if matchend(plugin, '\.vim') == len(plugin)
      call TrySource(s:dirname . '/plugins/' . plugin)
    else
      call TrySource(s:dirname . '/plugins/' . plugin . '.vim')
    endif
  endfor
endfunction

function! s:load_custom_plugins()
  for plugin in g:custom_plugins
    if len(plugin) > 1
      execute "Plug '" . plugin[0] . "', " .join(plugin[1:], ',')
    else
      execute "Plug '" . plugin[0] . "'"
    endif
  endfor
endfunction

call plug#begin()
call s:check_plugins()
call s:load_builtin_plugins()
call s:load_custom_plugins()
call plug#end()

if g:custom_guide_plugin == 'leader-guide'
  if !exists('g:custom_leader_guide')
    let g:custom_leader_guide = {
          \   mapleader: {
          \     'name': '<Leader>',
          \     'a': {'name': 'Alignment'},
          \     'b': {'name': 'Buffers'},
          \     'c': {'name': 'Comments'},
          \     'f': {'name': 'Fuzzy finder'},
          \     'g': {'name': 'Git'},
          \     'j': {'name': 'Jump'},
          \     's': {'name': 'Search'},
          \     't': {'name': 'Toggle'},
          \     'v': {'name': 'Vimux'},
          \   }
          \ }
    if maplocalleader != mapleader
      let g:custom_leader_guide[maplocalleader] = {
            \   'name': '<LocalLeader>'
            \ }
    endif
  endif

  autocmd VimEnter * if exists(':LeaderGuide') | call leaderGuide#register_prefix_descriptions('', 'g:custom_leader_guide') | endif
endif
