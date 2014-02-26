#!/bin/sh

# don't use .
BASEDIR=`dirname $0`

cp ${BASEDIR}/.profile ~/
cp ${BASEDIR}/.bashrc ~/
cp ${BASEDIR}/.inputrc ~/

# screen setting
cp ${BASEDIR}/.screenrc ~/

# tmux setting 
cp ${BASEDIR}/.tmux.conf ~/

# vim setting
cp -R ${BASEDIR}/.vim ~/

## since Vim 7.4, user can vimrc into $HOME/.vim/vimrc 
## so, if vim version is less than 7.4, make a link 
vim_version=`vim --version | grep "Vi IMproved" | awk '{print $5}'`
result=`awk 'BEGIN{ print '$vim_version' < 7.4  }'`  

if [ -L ~/.vimrc  ]; then  
    rm -f ~/.vimrc
fi

if [ "$result" -eq 1 ];then
    ln -s ~/.vim/vimrc ~/.vimrc
fi
