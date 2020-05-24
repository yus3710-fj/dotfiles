#!/bin/bash
DIR=`cd $(dirname $0) && pwd`

echo [upgrade packages]
sudo apt update
sudo apt upgrade -y

echo [install packages]
sudo apt install emacs build-essential gcc-multilib zsh screen make cmake python-pip python3-pip
