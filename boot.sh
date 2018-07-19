#! /usr/bin/env bash

export SYSCONFIGPATH=/usr/local/etc/user
export SYSCONFIGLOCKPATH=${SYSCONFIGPATH}/.sysconfig-lock
export USERCONFIGLOCKPATH=${HOME}/.userconfig-lock

export USER_ROOT=${HOME}/.$(whoami) # account specific root
export USER_SRC=${USER_ROOT}/src # account specific source directory
export USER_ETC=${USER_ROOT}/etc # account specific configuration files
export USER_DOT=${USER_ROOT}/dotfiles 

[[ ! (-e ${SYSCONFIGPATH}) ]] && {
  sudo -c "
    mkdir ${SYSCONFIGPATH};
    curl https://gitlab.com/colejhudson/dotfiles/raw/master/.bash_profile > ${SYSCONFIGPATH}/.bash_profile; \
  "
}

[[ ! (-e ${USER_ROOT}) ]] && {
  mkdir ${USER_ROOT}
  mkdir ${USER_SRC}
  mkdir ${USER_ETC}
  mkdir ${USER_DOT}

  mkdir ${USER_DOT}/$(basename ${SCRIPT})

  cp ${SYSCONFIGPATH}/.bash_profile ${USER_DOT}/.bash_profile
  ln -s  ${USER_DOT}/.bash_profile ${HOME}/.bash_profile

  curl "https://gitlab.com/colejhudson/dotfiles/blob/master/$(basename ${SCRIPT})/.$(uname | tr [[:upper:]] [[:lower:]])" > ${USER_DOT}/$(basename ${SCRIPT})/.$(uname | tr [[:upper:]] [[:lower:]])
}

source ${HOME}/.bash_profile
# TODO: Add default commands to install

# Install Homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"