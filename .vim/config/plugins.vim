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
      \   'YouCompleteMe',
      \   'airline',
      \   'ale',
      \   'asyncrun',
      \   'auto-pairs',
      \   'auto-save',
      \   'autoformat',
      \   'cpp',
      \   'editorconfig',
      \   'emacscommandline',
      \   'emmet',
      \   'endwise',
      \   'fugitive',
      \   'fzf',
      \   'gitgutter',
      \   'gnupg',
      \   'go',
      \   'is',
      \   'javascript',
      \   'jsdoc',
      \   'json',
      \   'kotlin',
      \   'leader-guide',
      \   'markdown',
      \   'nerdcommenter',
      \   'nerdtree',
      \   'pangu',
      \   'pydocstring',
      \   'rename',
      \   'repeat',
      \   'sneak',
      \   'surround',
      \   'tabular',
      \   'tagbar',
      \   'tmuxline',
      \   'typescript',
      \   'ultisnips',
      \   'undotree',
      \   'vue',
      \ ]

let s:custom_plugins = get(g:, 'custom_plugins', [])
let s:disabled_plugins = get(g:, 'custom_disabled_plugins', [])
let s:enabled_builtin_plugins = []

function! s:check_plugins()
  for plugin in s:builtin_plugins
    let need_enable = 1
    for disabled in s:disabled_plugins
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
  for plugin in s:custom_plugins
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

if !exists('g:custom_leader_guide')
  let g:custom_leader_guide = {
        \   mapleader: {
        \     'name': '<Leader>',
        \     'a': {'name': 'Alignment'},
        \     'c': {'name': 'Comments'},
        \     'f': {'name': 'Fuzzy finder'},
        \     'g': {'name': 'Git'},
        \     'j': {'name': 'Jump'},
        \     's': {'name': 'Search'},
        \     't': {'name': 'Toggle'},
        \   }
        \ }
  if maplocalleader != mapleader
    let g:custom_leader_guide[maplocalleader] = {
          \   'name': '<LocalLeader>'
          \ }
  endif
endif

autocmd VimEnter * if exists(':LeaderGuide') | call leaderGuide#register_prefix_descriptions('', 'g:custom_leader_guide') | endif
