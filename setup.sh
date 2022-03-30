#!/bin/bash
DIR=`cd $(dirname $0) && pwd`

#リンクを張らないファイルだけ手動で指定すればあとは自動でやってくれる
#今後これでうまくいかなくなる可能性もありますが…
DOTFILES=`ls -F ${DIR} | grep -v README | grep -v \* | grep -v /`
IGNORE=(env.bash)

echo [link dotfiles]
echo -e "\033[1;36m"$DIR "->" $HOME"\033[m"
for f in ${DOTFILES[@]}
do
    if [ `echo ${IGNORE[@]} | grep -w $f` ]; then #IGNOREに入っているファイルだったら無視
        continue
    fi
    echo .$f
    EXIST=`ls -aF ${HOME} | grep -w $f | grep -v @` #リンクじゃない素の同名ファイルを見つける
    if [ ${EXIST} ] #もしあったらdotをとる
    then
        echo "== original file exists! dot of the filename has been removed. =="
        mv ${HOME}/.$f ${HOME}/$f
    fi
    ln -sf ${DIR}/$f ${HOME}/.$f
done

#イニシャライズかなと思ったけどsudo使ってインストールするのとはちょっと違うのでこっちに書く
echo [git setup]
echo please input your name and email.
cd ${DIR}
read -p "git config --local user.name " GIT_NAME
git config --local user.name ${GIT_NAME}
read -p "git config --local user.email " GIT_MAIL
git config --local user.email ${GIT_MAIL}
echo git config --global core.editor emacs
git config --global core.editor emacs #commitメッセージ用のエディタをemacsに設定
echo git config --global "url.git@github.com:.pushinsteadof" "https://github.com/"
git config --global "url.git@github.com:.pushinsteadof" "https://github.com/" #pushするときだけSSH接続
git config --global alias.st status
git config --global alias.co checkout
