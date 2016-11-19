source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nobk
set nocp
set noswf
set noudf

set guioptions-=m
set guioptions-=T

set noai

set tabstop=4
set shiftwidth=4
set number

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set mouse=a
set acd

syntax on

autocmd! bufwritepost $MYVIMRC source %

colorscheme hemisu

set background=dark

set guifont=Source_Code_Pro:h11

set columns=105
set lines=49

set cursorline

winpos 941 0
