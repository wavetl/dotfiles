set nobk
set nocp
set noswf
set noai

set ts=4
set nu

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312

set mh
set ar
set mouse=a
set acd

"Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

 Plugin 'gmarik/Vundle.vim'
 Plugin 'kien/ctrlp.vim'
 Plugin 'vim-scripts/mru.vim'
 Plugin 'Lokaltog/vim-powerline'
 Plugin 'yantze/pt_black'

call vundle#end()

"ctrip
let g:ctrlp_map = '<c-p>'


"MRU
map <F6> <Esc>:MRU<CR>

filetype plugin indent on

colo pt_black

autocmd! bufwritepost $MYVIMRC source %
