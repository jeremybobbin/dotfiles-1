#!/bin/bash
cd ~
ln -s dotfiles/.vim .vim
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/scripts/ public_scripts
ln -s dotfiles/.gitconfig .
rm .bashrc
ln -s dotfiles/.bashrc .
ln -s dotfiles/.tmux.conf .
