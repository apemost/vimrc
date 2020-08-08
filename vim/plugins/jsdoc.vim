"*********************************************************************
" https://github.com/heavenshell/vim-jsdoc
"*********************************************************************

let g:jsdoc_tags = get(g:, 'jsdoc_tags', {
      \ 'returns': 'return',
      \ })

Plug 'heavenshell/vim-jsdoc'

autocmd BufNewFile,BufRead *.js,*.jsx nmap <silent> <LocalLeader>d <Plug>(jsdoc)
autocmd BufNewFile,BufRead *.ts,*.tsx nmap <silent> <LocalLeader>d <Plug>(jsdoc)
