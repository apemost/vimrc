"*********************************************************************
" https://github.com/soywod/kronos.vim
"*********************************************************************

let g:kronos_database = get(g:, 'kronos_database', expand('~/kronos.db'))

Plug 'soywod/kronos.vim'

autocmd FileType klist nmap <buffer> <silent> q :bdelete<CR>
autocmd FileType klist nmap <buffer> <silent> <C-l> <Plug>(kronos-list)
autocmd FileType klist nmap <buffer> <silent> <Tab> <Plug>(kronos-next-cell)
autocmd FileType klist nmap <buffer> <silent> <S-Tab> <Plug>(kronos-prev-cell)
