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

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-kr,cp949

set guioptions-=e

set mouse=a
set acd

set title

syntax on

if has('gui_running')
	set guifont=Menlo:h15
endif

set cursorline


" Use Unix as the standard file type
set ffs=unix,dos,mac

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
map <leader>tl :tabnext<cr>
map <leader>q :q<cr>

noremap <F1> <Esc>"


" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" select all
nmap <silent><leader>sa ggVG

nmap <silent><leader>ev :tabnew $MYVIMRC<CR>

" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-scripts/mru.vim'
Plugin 'Lokaltog/vim-powerline'

Plugin 'sickill/vim-monokai'

" plugin from http://vim-scripts.org/vim/scripts.html

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme Tomorrow

autocmd! bufwritepost $MYVIMRC source %

set laststatus=2
