#!/bin/bash
echo "It will take some time to finsh the setup..., please be patient"

if which apt-get >/dev/null; then
	sudo apt-get install -y vim git
elif which yum >/dev/null; then
	sudo yum install -y vim git
fi

cd ~/
mv -f ~/.vimrc ~/.vimrc_old


####  setup vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/xuliuchengxlc/dotfile.git ~/.dotfile

ln -s ~/.dotfile/vim/.vimrc ~/.vimrc

echo "installing plugins" > xlc
echo "It will quit automatically when the whole plugins are installed" >> xlc
echo "Please be patient..." >> xlc
vim xlc -c "PluginInstall" -c "q" -c "q"
rm xlc

echo "done!"
