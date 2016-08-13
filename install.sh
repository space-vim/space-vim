#!/bin/bash

echo "安装space-vim可能需要花费一些时间，请耐心等待......"


if which apt-get >/dev/null; then
	sudo apt-get install -y vim git
elif which apt >/dev/null; then
	sudo apt-get install -y vim git
elif which yum >/dev/null; then
	sudo yum install -y vim git
#### support mac
elif which brew >/dev/null; then
        brew install vim git
fi

cd "${HOME}" || exit

if [ -f "${HOME}/.vimrc" ]; then
	mv -f "${HOME}/.vimrc" "${HOME}/.vimrc_old"
fi

if [ -d "${HOME}/.vim" ]; then
	mv -f "${HOME}/.vim" "${HOME}/.vim_old"
fi

####  setup vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
space_vim='space-vim'
git clone https://github.com/xuliuchengxlc/vim.git "${HOME}/.vim/${space_vim}"

ln -s "${HOME}/.vim/${space_vim}/.vimrc"               "${HOME}/.vimrc"
ln -s "${HOME}/.vim/${space_vim}/.vimrc.basic"         "${HOME}/.vimrc.basic"
ln -s "${HOME}/.vim/${space_vim}/.vimrc.extra"         "${HOME}/.vimrc.extra"
ln -s "${HOME}/.vim/${space_vim}/.vimrc.plugin.list"   "${HOME}/.vimrc.plugin.list"
ln -s "${HOME}/.vim/${space_vim}/.vimrc.plugin.config" "${HOME}/.vimrc.plugin.config"

echo "********************************************** "       > xlc
echo "********************************************** "      >> xlc
echo "vundle正在安装插件......                       "      >> xlc
echo "可能需要一些时间来完成所有插件的安装，         "      >> xlc
echo "请耐心等待......, 安装完成后会自动退出。       "      >> xlc
echo "********************************************** "      >> xlc
echo "********************************************** "      >> xlc
echo "安装完成后须在terminal的设置中进行相关设置,    "      >> xlc
echo "即将原有字体改为带有'for powerline'的字体。    "      >> xlc
echo "否则airline会出现字符乱码，无法正常显示的情况。"      >> xlc
echo "********************************************** "      >> xlc
echo "********************************************** "      >> xlc

#### vundle install plugins
vim xlc -c "PluginInstall" -c "q" -c "q"

#### install powerline fonts
sh "${HOME}/.vim/bundle/fonts/install.sh"

rm xlc






