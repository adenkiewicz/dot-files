#!/bin/sh

DOT_FILES_DIR="$(dirname $(readlink -f $0))"

# vim
ln -s $DOT_FILES_DIR/vimrc ~/.vimrc
if [ ! -d ~/.vim ]; then ln -s $DOT_FILES_DIR/vim ~/.vim; fi

# tmux
ln -s $DOT_FILES_DIR/tmux.conf ~/.tmux.conf

# zsh
ln -s $DOT_FILES_DIR/zsh/zshrc ~/.zshrc
