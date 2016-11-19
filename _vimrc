source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nobk
set nocp
set noswf
set noudf

set guioptions-=m
set guioptions-=T

set ai
set si
set showmatch
set mousehide
set showcmd

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

colorscheme wombat

set background=dark

set guifont=Source_Code_Pro:h11

set cursorline

"MRU
map <F6> <Esc>:MRU<CR>

"NERDTree
map <F5> <Esc>:NERDTreeToggle<CR>
let NERDTreeWinPos=1
let NERDTreeIgnore=['\.exe$','\.bat$','\.dll$','\.jpg$','\.gif$','\.png$','\~$']

let mapleader=','
:nnoremap <leader>s vi{:sort<cr>

"For windows
if has('windows')
	winpos 941 1
	set columns=105
	set lines=49
endif
