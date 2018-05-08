"*********************************************************************
" vim-airline/vim-airline
"*********************************************************************

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

Plug 'vim-airline/vim-airline'

"*********************************************************************
" vim-airline/vim-airline-themes
"*********************************************************************

let g:airline_theme = g:custom_colorscheme
let g:airline_powerline_fonts = get(g:, 'airline_powerline_fonts', 1)

Plug 'vim-airline/vim-airline-themes'
