"*********************************************************************
" skywind3000/asyncrun.vim
"*********************************************************************

Plug 'skywind3000/asyncrun.vim'

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

nnoremap <Leader>: :AsyncRun<Space>
