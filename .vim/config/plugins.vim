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
      \   'typescript',
      \   'ultisnips',
      \   'undotree',
      \   'vue',
      \ ]

let s:custom_plugins = get(g:, 'custom_plugins', [])
let s:disabled_plugins = get(g:, 'custom_disabled_plugins', [])

function! s:load_builtin_plugins()
  for plugin in s:builtin_plugins
    if matchend(plugin, '\.vim') == len(plugin)
      call TrySource(s:dirname . '/plugins/' . plugin)
    else
      call TrySource(s:dirname . '/plugins/' . plugin . '.vim')
    endif
  endfor
endfunction

function! s:load_custom_plugins()
  for plugin in s:custom_plugins
    Plug plugin
  endfor
endfunction

call plug#begin()
call s:load_builtin_plugins()
call s:load_custom_plugins()
call plug#end()

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
        \     'w': {'name': 'Windows'},
        \   },
        \   maplocalleader: {
        \     'name': '<LocalLeader>'
        \   }
        \ }
endif

autocmd VimEnter * if exists(':LeaderGuide') | call leaderGuide#register_prefix_descriptions('', 'g:custom_leader_guide') | endif
