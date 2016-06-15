" Use Vim settings rather than Vi setting.
" This must be first, for it changes other options as a side effect.
" Use Vundle plugin to manage all other plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" .vimrc.vundle 中添加所需插件
source ~/.vimrc.plugin.list

call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" 无插件的通用基本设置
source ~/.vimrc.basic
" 无插件的个人基本设置
source ~/.vimrc.extra
" 插件相关设置
source ~/.vimrc.plugin.config

