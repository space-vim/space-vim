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
