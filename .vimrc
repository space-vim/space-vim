" Use Vim settings rather than Vi setting.
" This must be first, for it changes other options as a side effect.
" Use Vundle plugin to manage all other plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'easymotion/vim-easymotion'
Plugin 'luochen1990/rainbow'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kevinw/pyflakes-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'

Plugin 'L9'
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


" ====================================================
" ========    General Config
" ====================================================
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

" set paste会导致YCM的tab补全失效,导致delimitMate失效
" set paste

set ruler
set showcmd

set showmatch
set matchtime=1     "time for parenthesis matching

set cursorline      " Highlight current line
set cursorcolumn    " Highlight current column
hi CursorColumn ctermbg=239
hi CursorLine ctermbg=240
hi MatchParen cterm=bold ctermfg=gray ctermbg=green
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

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

" 共享剪贴板
set clipboard+=unnamed

set backspace=indent,eol,start
set linespace=0
set number
set showmatch
set matchtime=1

set winminheight=0
set wildmode=list:longest,full
set wildmenu
" not recommended
"set whichwrap+=<,>,[,],h,l,b,s
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
filetype indent plugin on

set nowrap       " Don't wrap lines
set linebreak    " Wrap lines at convennient points

" ======== Search ========
set hlsearch     " Find the next match as we type the search
set incsearch    " Highlight searches by default
set ignorecase   " Ignore case when searching...
set smartcase    " ...unless we type a capital
" 设置search时搜索结果高亮的前景色与背景色
" 输入:hi 即可查看所有高亮的颜色设置
hi Search term=standout ctermfg=52 ctermbg=11
hi IncSearch term=reverse cterm=bold ctermfg=53

" ======================================================
" =========    Key Mapping
" ======================================================
let mapleader="\<Space>"

nmap <leader>fs :w<cr>
nmap <leader>q  :q<cr>
nmap <leader>Q  :qa!<cr>
nmap <leader>d  <C-d>
nmap <leader>u  <C-u>

" Treat long lines ad break lines (useful when moving around in them)
map j gj
map k gk

" Remap VIM 0 to first non-blank character
map 0 ^

" 映射全选加复制 Ctrl+a
map <C-a> ggVGY
map! <C-a> <Esc>ggVGY

" 将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" 将系统剪贴板内容粘贴至vim
nmap <leader>p "+p
" F3分配给NERDTree
map <F3> :NERDTreeToggle<cr>
" f8分配给graphviz的dot命令，绘图
map <F8> :w<cr>:!dot -Tpng -o %<.png % && open %<.png<cr>

" =====================================================
" ========    Plugin Config
" =====================================================

" ========    airline                 =========
" ========    状态栏美化              =========
let t_Co=256
let g:airline_powerline_fonts=1
let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#whitespce#enabled=0
let g:airline#extensions#whitespace#symbol='!'
let g:airline#extensions#whitespace#mixed_indent_algo=2
let g:Powerline_symbols="fancy"

" ========    indentLine Config       ========
" ========    显示代码缩进            ========
let g:indentLine_enabled=1
let g:indentLine_color_term=239
let g:indentLine_char='┊'
let g:indentLine_concealcursor='vc' " default 'inc'

" ========    nerdtree                ========
" ========    文件浏览                ========
let NERDTreeShowHidden=1            " 显示隐藏文件
let NERDTreeAutoDeleteBuffer=1      " 删除文件时自动删除文件对应buffer

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ========    nerdcommenter           ========
" ========    快速注释代码            ========
" Usage: <leader>cc : 注释当前行
"        <leader>cs : 优雅地注释
"        <leader>cu : 取消注释
let NERDSpaceDelims=1

" ========    delimitMate             ========
" ========    括号、引号等自动补全    ========
let delimitMate_expand_cr=1

" ========    vim-trailing-whitespace ========
" ========    去除行尾多余的空格      ========
map <leader>tr :FixWhitespace<cr>

" ========    rainbow                 ========
" ========    彩虹括号                ========
let g:rainbow_active=1
let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \   }
            \}

" ===================================
" ========     syntastic     ========
" ===================================
" 每次调用:SyntasticSetLocList ，将错误覆盖 **quickfix**
let g:syntastic_always_populate_loc_list=1
" 自动拉起/关闭错误窗口，不需要手动调用:Errors
let g:syntastic_auto_loc_list=1
" 打开文件的时候做检查
let g:syntastic_check_on_open=0
" 每次保存的时候做检查
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes']  " 使用pyflakes 比pylint快, 需要pip安装pyflakes，
let g:syntastic_javascript_checkers=['jsl', 'jshint']  " npm 安装
let g:syntastic_html_checkers=['tidy', 'jshint']

" 修改高亮的背景色
hi SyntasticErrorSign guifg=red guibg=black
"hi SyntasticWarnSign guifg=yellow guibg=black

set statusline+=%{SyntasticStatusLineFlag()}
" 配置error-sign
let g:syntastic_error_symbol='>>'
let g:syntastic_style_error_symbol='E'
let g:syntastic_warning_symbol='>*'
let g:syntastic_style_warning_symbol='W'
let g:syntastic_aggregate_errors=1

map <leader>e :Errors<cr>
map <leader>st :SyntasticToggleMode<cr> " 开启/关闭syntastic
map <leader>sc :SyntasticCheck<cr>      " 手动调用语法检查
map <leader>si :SyntasticInfo<cr>       " 列出当前状态和可用check
map <leader>sr :SyntasticReset<cr>      " 清空错误信息

" =====================================
" ========    YouCompleteMe    ========
" =====================================
let g:ycm_global_ycm_extra_conf = '~/.vim/dotfile/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息
" let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径
" let g:ycm_collect_identifiers_from_tags_files=1
"设置error和warning的提示符，如果没有设置，ycm会以syntastic的
" g:syntastic_warning_symbol 和 g:syntastic_error_symbol 这两个为准
let g:ycm_error_symbol='✘✘'
let g:ycm_warning_symbol='✘*'
" 不设置该选项YCM会经常crashed
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
                    \ 'tagbar' : 1,
                    \ 'nerdtree' : 1,
                    \}
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'

"设置跳转的快捷键，可以跳转到definition和declaration
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yd :YcmDebugInfo<CR>
nnoremap <leader>yr :YcmRestartServer<CR>

" ======================================================
" ======== add title automatically for new file ========
" ======================================================
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
