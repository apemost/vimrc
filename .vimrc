"*********************************************************************
" Andrew's vimrc
" https://github.com/apemost/vimrc
"*********************************************************************

" Enable nocompatible
set nocompatible

if filereadable(expand('~/.vimrc.preload'))
  source ~/.vimrc.preload
endif

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/.vim/init.vim'

if filereadable(expand('~/.vimrc.afterload'))
  source ~/.vimrc.afterload
endif
