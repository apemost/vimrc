"*********************************************************************
" heavenshell/vim-jsdoc
"*********************************************************************

Plug 'heavenshell/vim-jsdoc'

let g:jsdoc_tags = {
      \   'returns': 'return',
      \ }

autocmd BufNewFile,BufRead *.js,*.jsx nmap <silent> <LocalLeader>d <Plug>(jsdoc)
autocmd BufNewFile,BufRead *.ts,*.tsx nmap <silent> <LocalLeader>d <Plug>(jsdoc)
