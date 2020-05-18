#!/bin/sh

#素朴なやつ
#あとで自動化するから許せ
rm ~/.bash_logout
ln -sf ~/.dotfiles/bash_logout ~/.bash_logout
rm ~/.bash_profile
ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
rm ~/.bashrc
ln -sf ~/.dotfiles/bashrc ~/.bashrc
rm ~/.zshrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
