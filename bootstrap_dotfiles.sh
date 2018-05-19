#!/bin/bash
cd ~
rm -rf ~/public_scripts ~/.vim ~/.vimrc ~/.gitconfig ~/.tmux.conf ~/.bashrc ~/.bash_profile

ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/scripts/ ~/public_scripts
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

case "$OSTYPE" in
	darwin*)	ln -s dotfiles/.bashrc .bash_profile ;;
	linux*)		ln -s dotfiles/.bashrc .bashrc ;;
	*)		echo "unknown OS $OSTYPE" ;;
esac
cd -
