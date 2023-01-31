"*********************************************************************
" https://github.com/vim-airline/vim-airline
"*********************************************************************

let g:airline#extensions#tabline#enabled =
      \ get(g:, 'airline#extensions#tabline#enabled', 1)
let g:airline#extensions#tabline#fnamemod =
      \ get(g:, 'airline#extensions#tabline#fnamemod', ':t')
let g:airline#extensions#tabline#tab_nr_type =
      \ get(g:, 'airline#extensions#tabline#tab_nr_type', 2)
let g:airline#extensions#tabline#show_tab_nr =
      \ get(g:, 'airline#extensions#tabline#show_tab_nr', 1)
let g:airline#extensions#tabline#show_tab_type =
      \ get(g:, 'airline#extensions#tabline#show_tab_type', 1)
let g:airline#extensions#tabline#buffer_idx_mode =
      \ get(g:, 'airline#extensions#tabline#buffer_idx_mode', 1)
let g:airline#extensions#tabline#buffers_label =
      \ get(g:, 'airline#extensions#tabline#buffers_label', 'BUFFERS')
let g:airline#extensions#tabline#tabs_label =
      \ get(g:, 'airline#extensions#tabline#tabs_label', 'TABS')
let g:airline#extensions#tmuxline#enabled =
      \ get(g:, 'airline#extensions#tmuxline#enabled', 1)

Plug 'vim-airline/vim-airline'

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

nmap <silent> [t <Plug>AirlineSelectPrevTab
nmap <silent> ]t <Plug>AirlineSelectNextTab

"*********************************************************************
" https://github.com/vim-airline/vim-airline-themes
"*********************************************************************

let g:airline_theme =
      \ get(g:, 'airline_theme', tolower(g:custom_colorscheme))
let g:airline_powerline_fonts =
      \ get(g:, 'airline_powerline_fonts', g:custom_powerline_fonts)

Plug 'vim-airline/vim-airline-themes'
