set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    basic setting
""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256      " required for airline
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set langmenu=zh-CN.UTF-8

colorscheme desert

syntax on
filetype on

set autoread

set smartindent    "autoindent for c

set mouse=a
set selection=exclusive
set selectmode=mouse,key

set paste

set ruler
set showcmd

set showmatch
set matchtime=1    "time for parenthesis matching

set cursorline    " highlight current line
set cursorcolumn   
hi CursorColumn ctermbg=236
hi CursorLine ctermbg=236

set laststatus=2    "required for airline

set history=10000

set nobackup
set noswapfile


set report=0

set wildignore=*.o,*~,*.pyc

set backspace=2

set tag=tags;/

set completeopt=longest,menu
set wildmenu

set viminfo+=!

set clipboard+=unnamed

set backspace=indent,eol,start
set linespace=0
set number
set showmatch
set matchtime=1
set hlsearch
set incsearch
set ignorecase
set smartcase
set winminheight=0
set wildmode=list:longest,full
set whichwrap+=<,>,[,],h,l,b,s
set scrolljump=5
set scrolloff=3

set nowrap
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<Space>"
nmap <leader>fs :w<cr>
nmap <leader>q  :q<cr>
nmap <leader>Q  :q!<cr>
nmap <leader>d  <C-d>
nmap <leader>u  <C-u>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    airline settting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let t_Co=256
let g:airline_powerline_fonts=1
let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

let g:airline#extensions#whitespce#enabled=0
let g:airline#extensions#whitespace#symbol='!'
let g:airline#extensions#whitespace#mixed_indent_algo=2

let g:Powerline_symbols="fancy"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_enabled=1
let g:indentLine_color_term=239
let g:indentLine_char='|'
let g:indentLine_concealcursor='vc' " default 'inc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    nerdtree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""   nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims=1
