syntax on
set guifont=Source\ Code\ Pro\ ExtraLight:h13
set background=dark
colorscheme monokai

" 复制，粘贴，剪切快捷键 仅在gvim中有效
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
nmap <C-v> "+p

" windows GUI界面乱码设置
if has('win32') && has("gui_running")
    set encoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
    set fileencoding=utf-8 " 新建文件使用的编码

    " 解决win菜单乱码
    set langmenu=zh_CN
    let $LANG = 'zh_CN.UTF-8'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "处理consle输出乱码
    language messages zh_CN.utf-8

    " Set extra options when running in GUI mode
    set guifont=Consolas:h13
    " set guifont＝Source\ Code\ Pro\ for\ Powerline
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set linespace=2
    set noimd
    " set showtabline=1   "
    " set guioptions+=e   " 这两个设置会使得插件airline上方的buffer状态栏无法显示
endif
