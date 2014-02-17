#!/bin/sh

cp ./.profile ~/
cp ./.bashrc ~/

# vim
mkdir -p ~/.vim/
cp -R ./.vim/ ~/.vim/
chmod 700 ~/.vim/
