"*********************************************************************
" https://github.com/heavenshell/vim-pydocstring
"*********************************************************************

let g:pydocstring_formatter = get(g:, 'pydocstring_formatter', 'numpy')

Plug 'heavenshell/vim-pydocstring', {'do': 'make install'}

autocmd BufNewFile,BufRead *.py nmap <silent> <LocalLeader>d <Plug>(pydocstring)
