"*********************************************************************
" vim-airline/vim-airline
"*********************************************************************

let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type= 2
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
let g:airline#extensions#tabline#tabs_label = 'TABS'

Plug 'vim-airline/vim-airline'

nmap <Leader>1 <Plug>AirlineSelectTab1<CR>
nmap <Leader>2 <Plug>AirlineSelectTab2<CR>
nmap <Leader>3 <Plug>AirlineSelectTab3<CR>
nmap <Leader>4 <Plug>AirlineSelectTab4<CR>
nmap <Leader>5 <Plug>AirlineSelectTab5<CR>
nmap <Leader>6 <Plug>AirlineSelectTab6<CR>
nmap <Leader>7 <Plug>AirlineSelectTab7<CR>
nmap <Leader>8 <Plug>AirlineSelectTab8<CR>
nmap <Leader>9 <Plug>AirlineSelectTab9<CR>

"*********************************************************************
" vim-airline/vim-airline-themes
"*********************************************************************

let g:airline_theme = g:custom_colorscheme
let g:airline_powerline_fonts = get(g:, 'airline_powerline_fonts', 1)

Plug 'vim-airline/vim-airline-themes'
