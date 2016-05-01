#!/bin/bash

rm -f ~/.vimrc
rm -rf ~/.vim


if [ -f "~/.vimrc_old" ]; then
	mv -f ~/.vimrc_old ~/.vimrc
fi

if [ -d "~/.vim_old" ]; then
	mv -f ~/.vim_old ~/.vim
fi



