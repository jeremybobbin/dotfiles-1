#!/bin/bash
# Flake8
sudo apt-get install flake8 -y

# Setup FASD
cd ~
git clone https://github.com/clvv/fasd.git
cd fasd/
sudo make install

# Setup dots
cd ~
ln -s dotfiles/.vim .vim
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/scripts/ public_scripts
ln -s dotfiles/.gitconfig .
rm .bashrc
ln -s dotfiles/.bashrc .
ln -s dotfiles/.tmux.conf .
