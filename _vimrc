if has("windows")
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif

set nobackup
set nocompatible
set noswapfile
set noundofile
set autoread

set guioptions-=m
set guioptions-=T

set autoindent smartindent
set showmatch
set mousehide
set showcmd
set noerrorbells novisualbell t_vb=

set tabstop=4
set shiftwidth=4
set number

set report=0

set foldmethod=indent

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set guioptions-=e

set mouse=a
set acd

syntax on

"set guifont=Source_Code_Pro:h12

set guifont=Fira_Code:h11

set cursorline

"Key mapping
"

function! ToggleHLS()
	if !exists('b:togglehls')
		let b:togglehls=1
	endif
	if b:togglehls == 1
		execute 'set nohls'
		let b:togglehls=0
	else
		execute "set hls"
		let b:togglehls=1
	endif
endfunction

map <silent><F9> <Esc>:call ToggleHLS()<CR>

"MRU
map <silent><F6> <Esc>:MRU<CR>

"NERDTree
map <silent><F5> <Esc>:NERDTreeToggle<CR>
let NERDTreeWinPos=1
let NERDTreeIgnore=['\.exe$','\.bat$','\.dll$','\.jpg$','\.gif$','\.png$','\~$']
let NERDTreeChDirMode=2
"let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1

let mapleader=','
:nnoremap <leader>s vi{:sort<cr>

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabp<cr>
map <leader>tl :tabn<cr>
map <leader>q :q<cr>

"For windows
if has('windows')
	winpos 941 1
	set columns=105
	set lines=49
	" 打开当前目录 windows
	map <leader>ex :!start explorer %:p:h<CR>

endif

colorscheme Tomorrow-Night-Blue

autocmd! bufwritepost $MYVIMRC source %
