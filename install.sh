#!/bin/sh

DOT_FILES_DIR="$(dirname $(readlink -f $0))"

install () {
    ln -s $DOT_FILES_DIR/$1 ~/$2 && echo "[+] $2" || echo "[-] $2"
}

# vim
install vimrc .vimrc
if [ ! -d ~/.vim ]; then 
    install vim, .vim
fi

# tmux
install tmux.conf .tmux.conf

# zsh
install zsh/zshrc .zshrc

# gdb
install gdbinit .gdbinit
