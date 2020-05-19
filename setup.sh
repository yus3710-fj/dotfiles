#!/bin/bash
DIR=`cd $(dirname $0) && pwd`

#素朴なやつ
#あとで自動化するから許せ
DOTFILES=(bash_logout bash_profile bashrc zshrc emacs.el)

echo [link dotfiles]
echo -e "\033[1;36m"$DIR "->" $HOME"\033[m"
for f in ${DOTFILES[@]}
do
    echo .$f
    EXIST=`ls -aF ${HOME} | grep $f | grep -v @` #リンクじゃない素の同名ファイルを見つける
    if [ ${EXIST} ] #もしあったらdotをとる
    then
        echo "== original file exists! dot of the filename has been removed. =="
        mv ${HOME}/.$f ${HOME}/$f
    fi
    ln -sf ${DIR}/$f ${HOME}/.$f
done

echo [git setup]
echo core.editor
git config --global core.editor emacs #commitメッセージ用のエディタをemacsに設定
