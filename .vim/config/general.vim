"*********************************************************************
" General
"*********************************************************************

" Optimize for fast terminal connections
set ttyfast

" Set to auto read when a file is changed from the outside
set autoread

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Use the OS clipboard by default
if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  else
    set clipboard=unnamed
  endif
endif

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Ignore case of searches
set ignorecase

" When searching try to be smart about cases
set smartcase

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Set default encoding to utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,default,latin1

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Don’t add empty newlines at the end of files
" set binary
" set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists('&undodir')
  set undodir=~/.vim/undo
  set undofile
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Change mapleader
let mapleader=' '
let maplocalleader=','
