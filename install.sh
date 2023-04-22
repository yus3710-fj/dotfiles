#!/bin/bash
DIR=`cd $(dirname $0) && pwd`

if [ -n "$WSL_DISTRO_NAME" ]; then
    echo [setting for WSL]
    #aptのリポジトリを日本のサーバに変更
    sudo sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
    #日本語化
    sudo apt update
    sudo apt install language-pack-ja
    sudo update-locale LANG=ja_JP.UTF-8
    sudo dpkg-reconfigure tzdata
fi

echo [upgrade packages]
sudo apt update
sudo apt upgrade -y

echo [install packages]
sudo apt install emacs build-essential gcc-multilib g++-multilib zsh screen make cmake gdb ninja-build python3-pip sshfs llvm graphviz ruby gfortran libopenmpi-dev libcoarrays-dev libcaf-openmpi-3
