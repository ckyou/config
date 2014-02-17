#!/bin/sh

# don't use .
BASEDIR=`dirname $0`

cp ${BASEDIR}/.profile ~/
cp ${BASEDIR}/.bashrc ~/

# screen setting
cp ${BASEDIR}/.screenrc ~/

# vim setting
cp -R ${BASEDIR}/.vim ~/
