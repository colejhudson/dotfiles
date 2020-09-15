# Unix
export EDITOR='vim'
export TERM='xterm-256color'
export LANG='en_US.UTF-8'
export LC_COLLATE='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_MESSAGES='en_US.UTF-8'
export LC_MONETARY='en_US.UTF-8'
export LC_NUMERIC='en_US.UTF-8'
export LC_TIME='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# zsh
bindkey -e
bindkey \^u backward-kill-line

# Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# GPG
export GPG_TTY=$(tty)

# Node
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# OCaml
. /Users/work/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# PlaidML
export PLAIDML_NATIVE_PATH=/usr/local/lib/libplaidml.dylib
export RUNFILES_DIR=/usr/local/share/plaidml

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Ruby
if [[ -e $HOME/.rvm ]]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  export PATH="$PATH:$HOME/.rvm/bin"
fi

export PATH="$HOME/.rvm/gems/ruby-2.7.1/bin:$PATH"

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# GPG
export GPG_TTY=$(tty)

# Misc
export PATH=$PATH:$HOME/.local/bin
