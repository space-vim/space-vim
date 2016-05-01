#!/bin/bash
echo "installing..."

if which apt-get >/dev/null; then
	sudo apt-get install -y vim git
elif which yum >/dev/null; then
	sudo yum install -y vim git
fi

####  setup vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/xuliuchengxlc/dotfile.git ~/.dotfile

ln -s ~/.dotfile/vim/.vimrc ~/.vimrc

echo "installing vim plugins"
vim xlc -c "PluginInstall" -c "q" -c "q"
rm xlc

echo "finshed"
