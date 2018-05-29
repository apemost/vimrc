"*********************************************************************
" Yggdroot/indentLine
"*********************************************************************

let g:indentLine_char = '│'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let g:indentLine_fileType = [
      \   'sh',
      \   'zsh',
      \   'vim',
      \   'c',
      \   'cpp',
      \   'python',
      \   'javascript',
      \   'javascript.jsx',
      \   'json',
      \   'typescript',
      \   'java',
      \   'kotlin',
      \   'objc',
      \   'objcpp',
      \   'vue',
      \   'groovy',
      \   'yaml',
      \ ]
let g:indentLine_fileTypeExclude = [
      \   'help',
      \   'man',
      \   'startify',
      \   'vimfiler',
      \   'markdown'
      \ ]

Plug 'Yggdroot/indentLine'

nnoremap <Leader>tl :IndentLinesToggle<CR>
