#!/usr/bin/env bash

# NOTE: This file should contain things that NEED to be run each time a shell boots up

# NOTE: On macOS, Ubuntu, and (recently) Windows, bash is the default shell option hence
# this is the means by which the rest of my config will boot.

# NOTE: On macOS, gdb needs SIP to be disabled so it can control other processes at will, 
# to do so; 'csrutil enable --without debug' must be run while the OS is in Safe Mode

# NOTE: On macOS, by default gdb-8 (from homebrew) does not work without installing the MacOSX.sdk
# and symlinking it's include directory - at ${SDK_PATH}/usr/include - to /usr/include

export SYS_CONFIG_PATH=/usr/local/etc/user
export SYS_CONFIG_LOCK=${SYS_CONFIG_PATH}/.sysconfig-lock
export USER_CONFIG_LOCK=${HOME}/.userconfig-lock

export USER_ROOT=${HOME}/.$(whoami) 
export USER_SRC=${USER_ROOT}/src 
export USER_ETC=${USER_ROOT}/etc 
export USER_DOT=${USER_ROOT}/dotfiles 

[[ -e ${USER_ROOT} ]] || {
  echo "It doesn't seem like this account has been configured?"
  read -p "Configure now? [Y/n] " CONFIGUREP
  
  case ${CONFIGUREP} in
    Y|y|yes) 
      echo "Retrieving keys."
      source <(curl https://gitlab.com/colejhudson/secrets/raw/master/apikeys.secret | keybase pgp decrypt) 
      echo "Retrieving config script."
      source <(curl -X GET --header "PRIVATE-TOKEN: ${GITLAB_DOTFILES_READ_KEY}" https://gitlab.com/colejhudson/dotfiles/raw/master/boot.sh)
      unset ${GITLAB_DOTFILES_READ_KEY}
    ;;
    *)
      echo "Exiting." 
      exit 1 
    ;;
  esac
}

export KERNEL=$(uname | tr [[:upper:]] [[:lower:]])
source ${USER_DOT}/${KERNEL}
source ${USER_DOT}/.aliases
source ${USER_DOT}/.functions

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias c="clear"

alias l="ls -a"
alias ll="ls -la"

alias v='nvim'
alias vv='v ~/.vimrc'
alias vc='v ${USER_DOT}/${KERNEL}'
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
if [ -e /Users/work/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/work/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
