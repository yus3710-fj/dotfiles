#!/bin/sh

if [ $# -ne 1 ]; then
    echo "[usage]"
    echo "cwd.sh \$pid"
    exit 1
fi

ls -l /proc/$1/cwd
