"*********************************************************************
" https://github.com/skywind3000/asyncrun.vim
"*********************************************************************

let g:asyncrun_open = get(g:, 'asyncrun_open', 10)

Plug 'skywind3000/asyncrun.vim'

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

nnoremap <Leader>: :AsyncRun<Space>
