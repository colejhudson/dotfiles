# zsh
bindkey -e
bindkey \^u backward-kill-line

# Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:~/.local/bin

# GPG
export GPG_TTY=$(tty)

# Node
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Deno
export DENO_INSTALL="/Users/work/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# OCaml
. /Users/work/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# PlaidML
export PLAIDML_NATIVE_PATH=/usr/local/lib/libplaidml.dylib
export RUNFILES_DIR=/usr/local/share/plaidml

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Ruby
export PATH="$HOME/.rvm/gems/ruby-2.7.1/bin:$PATH"
