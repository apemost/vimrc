"*********************************************************************
" Yggdroot/indentLine
"*********************************************************************

let g:indentLine_char = '│'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_fileTypeExclude = [
      \   'help',
      \   'man',
      \   'startify',
      \   'vimfiler',
      \   'markdown'
      \ ]

Plug 'Yggdroot/indentLine'

nnoremap <Leader>tl :IndentLinesToggle<CR>
