#! /usr/bin/env bash

export SYSCONFIGPATH=/usr/local/etc/user
export SYSCONFIGLOCKPATH=${SYSCONFIGPATH}/.sysconfiglock
export USERCONFIGLOCKPATH=${HOME}/.userconfiglock

export USER_ROOT=${HOME}/.$(whoami) # account specific root
export USER_SRC=${USER_ROOT}/src # account specific source directory
export USER_ETC=${USER_ROOT}/etc # account specific configuration files
export USER_DOT=${USER_ROOT}/dotfiles 

[[ -e ${SYSCONFIGPATH} ]] || {
  mkdir ${SYSCONFIGPATH}

  # Because the repo is private a key is needed 
  curl -X GET --header "PRIVATE-TOKEN: ${GITLAB_DOTFILES_READ_KEY}" https://gitlab.com/colejhudson/dotfiles/raw/master/.bash_profile > ${SYSCONFIGPATH}/.bash_profile

  case $(uname -a) in
    darwin)
        command -v brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ;;
    *) 
      continue
    ;;
  esac
}

INSTALL_CLIENT=$(command -v brew || command -v apt-get)

function install_if_not_found() {
  echo "Checking for an instance ${1}..."
  command -v ${1} &> /dev/null || {
    echo "Couldn't find ${1} in PATH. Installing instead." 
    ${INSTALL_CLIENT} install "${1}"
    return 0
  }
  echo "${1} was found in PATH"
}

[[ -e ${USER_ROOT} ]] || {
  mkdir ${USER_ROOT}
  mkdir ${USER_SRC}
  mkdir ${USER_ETC}
  mkdir ${USER_DOT}

  mkdir ${USER_DOT}/$(basename ${SCRIPT})

  cp ${SYSCONFIGPATH}/.bash_profile ${USER_DOT}/.bash_profile
  ln -s ${USER_DOT}/.bash_profile ${HOME}/.bash_profile

  (
    read -p "Which config would you like to install? (e.g. bash, fish, csh):" SHELL
    case ${SHELL} in
      bash|Bash)
        curl -X GET --header "PRIVATE-TOKEN: ${GITLAB_DOTFILES_READ_KEY}" "https://gitlab.com/colejhudson/dotfiles/blob/master/$(basename ${SCRIPT})/.$(uname | tr [[:upper:]] [[:lower:]])" 
        ;;
      fish)
        
        ;;
      *)
        echo "A configuration file for that shell isn't available. Exiting."
        return 1
        ;;
    esac 
  )> ${USER_DOT}/$(basename ${SCRIPT})/.$(uname | tr [[:upper:]] [[:lower:]])


  ${INSTALL_CLIENT} update

  install_if_not_found ssh
  install_if_not_found ssh-keygen

  echo "Configuring ssh"
  read -p "Which email should be used to setup ssh?: " SSH_EMAIL
  ssh-keygen -t rsa -b 4096 -C ${SSH_EMAIL}
  
  echo "Getting ssh-agent PID and SOCK"
  eval "$(ssh-agent -s)"
  echo "Adding generated ssh keys"
  ssh-add -K ${HOME}/.ssh/id_rsa

  install_if_not_found git
}

source ${HOME}/.bash_profile