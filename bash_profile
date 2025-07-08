# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export NVCOMPILERS=/opt/nvidia/hpc_sdk
export NVARCH=`uname -s`_`uname -m`
export NVHPC_ROOT=$NVCOMPILERS/$NVARCH/24.5
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
export SCREENDIR=$HOME/.screen
export PATH=$PATH:/usr/local/cuda/bin:$NVHPC_ROOT/compilers/bin:$HOME/.dotfiles/bin
export LESSCHARSET=utf-8

export BASH_SILENCE_DEPRECATION_WARNING=1
