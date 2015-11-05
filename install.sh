#!/bin/sh

# get the absolute path of this script
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

confirm_prompt(){
    read -r -p "$1 [y/N]: " yn   
    case $yn in
        [yY][eE][sS]|[yY]) return 0 ;;  #TRUE      
        *) return 1 ;;                  #FALSE
    esac
} 

create_soft_link(){
    echo "try to link $2 to $1"
    if [ -f $2 ]; then
        if confirm_prompt "-> $2 already exists, replace it? "; then
            ln -s -f $1 $2
            echo "-> ok, replace $1 "
        fi
    else
        ln -s $1 $2
        echo "-> ok, create the link"
    fi
}

create_soft_link_by_name(){
    create_soft_link "$BASEDIR/$1" "$HOME/$1"
}


# bash setting
create_soft_link_by_name .profile
create_soft_link_by_name .bashrc
create_soft_link_by_name .inputrc

# screen setting
create_soft_link_by_name .screenrc

# tmux setting 
create_soft_link_by_name .tmux.conf

# vim setting
## since Vim 7.4, user can put .vimrc inside $HOME/.vim/ folder 
## but for compatiability, still create a link in user'home folder 
create_soft_link_by_name ".vim"
create_soft_link "$HOME/.vim/vimrc" "$HOME/.vimrc"
        
# neovim setting 
if `command -v nvim > /dev/null 2>&1` \
    || confirm_prompt "you haven't install neovim, still create its configuration links?" ; then
    
    echo "try to link $HOME/.config/nvim & $HOME/.config/nvim/init.vim"
    if [ -L ~/.config ]; then
        mkdir ~/.config
    fi

    create_soft_link "$BASEDIR/.vim" "$HOME/.config/nvim"
    create_soft_link "$BASEDIR/.vim/vimrc" "$HOME/.config/nvim/init.vim"
fi
