#!/bin/sh

# don't use .
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


ln -s ${BASEDIR}/.profile ~/.profile
ln -s ${BASEDIR}/.bashrc ~/.bashrc
ln -s ${BASEDIR}/.inputrc ~/.inputrc

# screen setting
ln -s ${BASEDIR}/.screenrc ~/.screenrc

# tmux setting 
ln -s ${BASEDIR}/.tmux.conf ~/.tmux.conf

# vim setting
ln -s  ${BASEDIR}/.vim ~/.vim 

## since Vim 7.4, user can vimrc into $HOME/.vim/vimrc 
## so, if vim version is less than 7.4, make a link 
#vim_version=`vim --version | grep "Vi IMproved" | awk '{print $5}'`
#result=`awk 'BEGIN{ print '$vim_version' < 7.4  }'`  

if [ -L ~/.vimrc  ]; then  
    rm -f ~/.vimrc
fi

#if [ "$result" -eq 1 ];then
    ln -s ~/.vim/vimrc ~/.vimrc
#fi
