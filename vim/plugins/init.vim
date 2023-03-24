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
      \ 'asyncrun',
      \ 'auto-pairs',
      \ 'auto-save',
      \ 'bbye',
      \ 'bufonly',
      \ 'closetag',
      \ 'cpp',
      \ 'docker',
      \ 'editorconfig',
      \ 'emacscommandline',
      \ 'emmet',
      \ 'endwise',
      \ 'fugitive',
      \ 'fzf',
      \ 'gitgutter',
      \ 'gnupg',
      \ 'gruvbox',
      \ 'gv',
      \ 'is',
      \ 'javascript',
      \ 'jinja',
      \ 'jsdoc',
      \ 'json',
      \ 'jump',
      \ 'kotlin',
      \ 'lark',
      \ 'latex',
      \ 'markdown',
      \ 'mermaid',
      \ 'neoformat',
      \ 'nerdcommenter',
      \ 'nerdtree',
      \ 'nginx',
      \ 'pangu',
      \ 'plantuml',
      \ 'pug',
      \ 'pydocstring',
      \ 'quickrun',
      \ 'rename',
      \ 'repeat',
      \ 'rust',
      \ 'sneak',
      \ 'surround',
      \ 'swift',
      \ 'tabular',
      \ 'tagbar',
      \ 'toml',
      \ 'typescript',
      \ 'undotree',
      \ 'vue',
      \ ]

if has('python3')
  call add(s:builtin_plugins, 'ultisnips')
endif

if !has('gui_running')
  call add(s:builtin_plugins, 'tmuxline')
endif

if v:version >= 702
  call add(s:builtin_plugins, 'airline')
endif

if v:version > 704 || (v:version == 704 && has('patch2009'))
  call add(s:builtin_plugins, 'go')
endif

if v:version >= 801
  call add(s:builtin_plugins, 'illuminate')
endif

if HasFeatures()
  if !empty(g:custom_completion_plugin)
    call add(s:builtin_plugins, g:custom_completion_plugin)
  endif
  if !empty(g:custom_lint_plugin)
    call add(s:builtin_plugins, g:custom_lint_plugin)
  endif
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
      call TrySource(s:dirname . '/' . plugin)
    else
      call TrySource(s:dirname . '/' . plugin . '.vim')
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
