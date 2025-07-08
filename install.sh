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
elif [ `echo $OSTYPE | grep "darwin"` ]; then
    if [ ! -x /opt/homebrew/bin/brew ]; then
        echo "You need install Homebrew first."
        echo "See https://brew.sh"
        exit 1
    fi
fi

echo [upgrade packages]
case ${OSTYPE} in
    linux*)
        sudo apt update
        sudo apt upgrade -y
        ;;
    darwin*)
        brew upgrade
        ;;
esac

echo [install packages]
case ${OSTYPE} in
    linux*)
        sudo apt install emacs build-essential gcc-multilib g++-multilib gfortran make cmake gdb ninja-build \
                         zsh screen python3-dev sshfs llvm lld graphviz ruby-full libopenmpi-dev libcoarrays-dev libcaf-openmpi-3
        ;;
    darwin*)
        brew install emacs gcc cmake ninja lld
        ;;
esac
