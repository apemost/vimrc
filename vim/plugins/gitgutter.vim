"*********************************************************************
" https://github.com/airblade/vim-gitgutter
"*********************************************************************

let g:gitgutter_map_keys = get(g:, 'gitgutter_map_keys', 0)

Plug 'airblade/vim-gitgutter'

nmap <silent> ]g :GitGutterNextHunk<CR>
nmap <silent> [g :GitGutterPrevHunk<CR>
