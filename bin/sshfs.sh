#!/bin/sh

if [ "$#" -ne 1 ];then
    echo usage \"sshfs.sh {server_name}:{directory}\"
else
    if [ -n "$WSL_DISTRO_NAME" ];then
        sshfs -o allow_other $1 ${HOME}/sshmnt/
    else
        sshfs $1 ${HOME}/sshmnt/
    fi
fi
