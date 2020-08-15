"*********************************************************************
" https://github.com/alvan/vim-closetag
"*********************************************************************

let g:closetag_emptyTags_caseSensitive =
      \ get(g:, 'g:closetag_emptyTags_caseSensitive', 1)
let g:closetag_filetypes =
      \ get(g:, 'closetag_filetypes', 'html,xhtml,phtml,javascript.jsx,typescript.tsx')

Plug 'alvan/vim-closetag'
