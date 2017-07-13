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
set history=1024

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
set fileencodings=utf-8,euc-kr,gb2312,gbk,big5

set guioptions-=e

set mouse=a
set acd

set title

syntax on

"set guifont=Dejavu_Sans_Mono:h11
set guifont=Inconsolata:h13:cANSI

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

"MRU
map <silent><F6> <Esc>:MRU<CR>

"NERDTree
map <silent><F5> <Esc>:NERDTreeToggle<CR>
let NERDTreeWinPos=1
let NERDTreeIgnore=['\.exe$','\.bat$','\.dll$','\.jpg$','\.gif$','\.png$','\~$']
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=0
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

"For windows
if has('windows')
	winpos 1165 191
	set columns=105
	set lines=45
	" 打开当前目录 windows
	map <leader>ex :!start explorer %:p:h<CR>

endif

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

" copy current filepath to cilpboard
nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

nmap <silent><leader>ev :e $MYVIMRC<CR>

set rtp+=$USERPROFILE/.vim/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
Plugin 'vim-scripts/mru.vim'
let MRU_Max_Entries = 1024
let MRU_Window_Height = 10


Plugin 'Lokaltog/vim-powerline'

" All of your Plugins must be added before the following line

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

call vundle#end()            " required

filetype plugin on

" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

"set background=dark
colorscheme Tomorrow-Night-Blue

autocmd! bufwritepost $MYVIMRC source %

set laststatus=2
