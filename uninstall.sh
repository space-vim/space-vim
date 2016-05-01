#!/bin/bash

rm -f ${HOME}/.vimrc
rm -rf ${HOME}/.vim


if [ -f "${HOME}/.vimrc_old" ]; then
	mv -f ${HOME}/.vimrc_old ${HOME}/.vimrc
fi

if [ -d "${HOME}/.vim_old" ]; then
	mv -f ${HOME}/.vim_old ${HOME}/.vim
fi



