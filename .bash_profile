#!/usr/bin/env bash

export EDITOR='nvim'
export TERM='xterm-256color'
export COMPUTER_NAME='colejhudson'

export LANG='en_US.UTF-8'
export LC_COLLATE='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_MESSAGES='en_US.UTF-8'
export LC_MONETARY='en_US.UTF-8'
export LC_NUMERIC='en_US.UTF-8'
export LC_TIME='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export GPG_TTY=$(tty)

export GOPATH=$(brew --prefix)/lib/go:$GOPATH

export NVM_DIR=$HOME/.nvm
export NODEPATH=$NODE_PATH:$(brew --prefix)/lib/node_modules
export NODEPATH=$NODE_PATH:$HOME/.config/yarn/global
export NODEPATH=$NODE_PATH:$HOME/.npm

export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/cuda/bin:$PATH
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=/usr/local/opt/node/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/Users/work/.deno/bin:$PATH
export PATH=$HOME/.work/dotfiles/scripts/homebrew:$PATH
export PATH=/Users/work/Library/Python/3.7/bin/:$PATH

alias c='clear'

alias l='ls -ha'
alias ll='l -l'

alias ..='cd ..'
alias ...='cd ../..'

# rlwrap depends on libreadline 6 which homebrew will
# replace with libreadline 7. They contain all the same
# symbols (I believe), so the solution is alias version 7 
# by symlinking libreadline.7.dylib to libreadline.6.dylib
alias coqtop='rlwrap coqtop'

alias v='vim'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

alias please='sudo'

alias portof='lsof -i :'

alias serve="node -e \"require('http').createServer((rq,rs) => rs.end(require('fs').readFileSync(rq.url.slice(1))).listen(8072)\""
