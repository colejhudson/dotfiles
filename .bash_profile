#!/usr/bin/env bash

# NOTE: This file should contain things that NEED to be run each time a shell boots up

# NOTE: On macOS, Ubuntu, and (recently) Windows, bash is the default shell option hence
# this is the means by which the rest of my config will boot.

# NOTE: On macOS, gdb needs SIP to be disabled so it can control other processes at will, 
# to do so; 'csrutil enable --without debug' must be run while the OS is in Safe Mode

export SYSCONFIGPATH=/usr/local/etc/user
export SYSCONFIGLOCKPATH=${SYSCONFIGPATH}/.sysconfig-lock
export USERCONFIGLOCKPATH=${HOME}/.userconfig-lock

export USER_ROOT=${HOME}/.$(whoami) # account specific root
export USER_SRC=${USER_ROOT}/src # account specific source directory
export USER_ETC=${USER_ROOT}/etc # account specific configuration files
export USER_DOT=${USER_ROOT}/dotfiles # account specific dotfiles

export CONFIG=$(basename ${SHELL})/.$(uname | tr [[:upper:]] [[:lower:]])

source ${USER_DOT}/${CONFIG}

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias c="clear"

alias l="ls -a"
alias ll="ls -la"

alias v='nvim'
alias vv='v ~/.vimrc'
alias vc='v ${DOT}/${CONFIG}'
alias vb='v ${HOME}/.bash_profile'

alias e="emacsclient -nw"
alias ee="e ~/.emacs.d/init.el"
alias ec="e ${USER_DOT}/${CONFIG}"
alias eb="e ${HOME}/.bash_profile"

alias ..="cd .."
alias ...="cd ../.."

export GPG_TTY=$(tty)

[[ -e ${HOME}/.opam ]] && { source ${HOME}/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true; }

clear