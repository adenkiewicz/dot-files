#!/bin/sh

DOT_FILES_DIR="$(dirname $(readlink -f $0))"

# vim
ln -s $DOT_FILES_DIR/vimrc ~/.vimrc
ln -s $DOT_FILES_DIR/vim ~/.vim

# tmux
ln -s $DOT_FILES_DIR/tmux.conf ~/.tmux.conf

# zsh
ln -s $DOT_FILES_DIR/zsh/.zshrc ~/.zshrc
