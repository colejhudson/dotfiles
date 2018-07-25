#! /usr/bin/env bash

alias emacs-server-start='emacs -nw --daemon --eval "(server-start)"'
alias emacs-server-stop='e --eval "(kill-emacs)"'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias vim='nvim'

alias sbcl-quicklisp='sbcl --load ${QUICKLISPPATH}/setup.lisp'
alias sbcl-quicklisp-eval-and-quit='sbcl-quicklisp --quit --eval'
alias common-lisp='sbcl-quicklisp'

# alias mktempfifo='TMP=$(mktemp -u) && { mkfifo -m 600 ${TMP}; echo ${TMP}; }'
alias f='fzf'
alias copy='pbcopy'
alias please='sudo'