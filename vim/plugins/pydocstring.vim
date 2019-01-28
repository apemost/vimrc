"*********************************************************************
" heavenshell/vim-pydocstring
"*********************************************************************

Plug 'heavenshell/vim-pydocstring'

autocmd BufNewFile,BufRead *.py nmap <silent> <LocalLeader>d <Plug>(pydocstring)
