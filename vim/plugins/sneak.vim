"*********************************************************************
" https://github.com/justinmk/vim-sneak
"*********************************************************************

let g:sneak#label = get(g:, 'sneak#lable', 1)
let g:sneak#use_ic_scs = get(g:, 'sneak#use_ic_scs', 1)

Plug 'justinmk/vim-sneak'

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
