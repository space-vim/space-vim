" Use Vim settings rather than Vi setting.
" This must be first, for it changes other options as a side effect.
" Use Vundle plugin to manage all other plugins
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

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
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
""""    General Config
""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256       " required for airline

" This makes vim act like all other editoes, buffers can
" exist in the background without being in a window.
set hidden        

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set langmenu=zh-CN.UTF-8

colorscheme desert

syntax enable      " turn on syntax highlighting66
syntax on           
filetype on

set autoread
set autowrite

set mouse=a
set selection=exclusive
set selectmode=mouse,key

set paste

set ruler
set showcmd

set showmatch
set matchtime=1     "time for parenthesis matching

set cursorline      " Highlight current line
set cursorcolumn    " Highlight current column
hi CursorColumn ctermbg=236
hi CursorLine ctermbg=236

set laststatus=2    "required for airline

set history=10000

" ======== Turn off swap files ========
set nobackup
set noswapfile
set nowb

set report=0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows

set backspace=2

set tag=tags;/

set completeopt=longest,menu

set viminfo+=!

set clipboard+=unnamed

set backspace=indent,eol,start
set linespace=0
set number
set showmatch
set matchtime=1

set winminheight=0
set wildmode=list:longest,full
set wildmenu
set whichwrap+=<,>,[,],h,l,b,s
set scrolljump=5
set scrolloff=3

" ======== Indentation ========
set autoindent
set smartindent 
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap p p=`]<C-o>

filetype plugin on
filetype indent on

set nowrap       " Don't wrap lines 
set linebreak    " Wrap lines at convennient points

" ======== Search ========
set hlsearch     " Find the next match as we type the search
set incsearch    " Highlight searches by default
set ignorecase   " Ignore case when searching...
set smartcase    " ...unless we type a capital
" 设置search时搜索结果高亮的前景色与背景色
hi Search term=standout ctermfg=52 ctermbg=11

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<Space>"

nmap <leader>fs :w<cr>
nmap <leader>q  :q<cr>
nmap <leader>Q  :qa!<cr>
nmap <leader>d  <C-d>
nmap <leader>u  <C-u>

" 将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" 将系统剪贴板内容粘贴至vim
nmap <leader>p "+p

map <F3> :NERDTreeToggle<cr>
map <F12> gg=G

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    Plugin Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ======== airline =========
let t_Co=256
let g:airline_powerline_fonts=1
let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#whitespce#enabled=0
let g:airline#extensions#whitespace#symbol='!'
let g:airline#extensions#whitespace#mixed_indent_algo=2
let g:Powerline_symbols="fancy"

" ======== indentLine Config ========
let g:indentLine_enabled=1
let g:indentLine_color_term=239
let g:indentLine_char='┊'
let g:indentLine_concealcursor='vc' " default 'inc'

" ========  nerdtree ========
let NERDTreeShowHidden=1            " 显示隐藏文件
let NERDTreeAutoDeleteBuffer=1      " 删除文件时自动删除文件对应buffer
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ======== nerdcommenter ========
" Usage: <leader>cc : 注释当前行
"        <leader>cs : 优雅地注释
"        <leader>cu : 取消注释
let NERDSpaceDelims=1

" ======== add title automatically for new file ========
autocmd BufNewFile *.py,*.rb,*.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
func SetTitle() 
    if &filetype == 'sh' 
        call setline(1,"#!/bin/bash") 
        call append(line("."), "") 

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."), "# -*- coding: utf-8 -*-")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."), "# encoding: utf-8")
        call append(line(".")+1, "") 

    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+2, " ************************************************************************/") 
        call append(line(".")+3, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+4, "#include<iostream>")
        call append(line(".")+5, "using namespace std;")
        call append(line(".")+6, "")
    elseif &filetype == 'c'
        call append(line(".")+4, "#include<stdio.h>")
        call append(line(".")+5, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
