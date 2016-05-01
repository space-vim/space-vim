#!/bin/bash
echo "It will take some time to finsh the setup..., please be patient"

if which apt-get >/dev/null; then
	sudo apt-get install -y vim git
elif which yum >/dev/null; then
	sudo yum install -y vim git
fi

cd ~/

if [ -f "~/.vimrc" ]; then
	mv -f ~/.vimrc ~/.vimrc_old
fi

if [ -d "~/.vim" ]; then
	mv -f ~/.vim ~/.vim_old
fi

if [ -f "~/.dotfile" ]; then
	mv -f ~/.dotfile ~/.dotfile_old
fi

####  setup vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/xuliuchengxlc/dotfile.git ~/.dotfile

ln -s ~/.dotfile/vim/.vimrc ~/.vimrc

echo "***************************************" > xlc
echo "vundle正在安装插件......" >> xlc
echo "可能需要一些时间来完成所有插件的安装，" >> xlc
echo "请耐心等待......" >> xlc
echo "***************************************" >> xlc

#### install plugins
vim xlc -c "PluginInstall" -c "q" -c "q"

rm xlc

if [ -d "~/.fonts" ]; then
	mv -f ~/.fonts ~/.fonts_old
fi

#### fetch and install powerline fonts
git clone https://github.com/powerline/fonts.git ~/.fonts
sh ~/.fonts/install.sh

echo "*********     就快完成啦！    *********" 
echo "现在只须在terminal的字体设置中将字体样式更改为带有“for powerline”的即可。"
echo "否则airline可能会出现字符乱码，无法正常显示的情况。"
echo "***************************************"
