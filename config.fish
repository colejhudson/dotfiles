#!/usr/local/bin/fish

set ROOT $HOME/.(whoami)
set SRC $ROOT/src
set ETC $ROOT/etc
set DOT $ROOT/dotfiles

if test $CONFIGURED; and status --is-interactive
	source $DOT/.(uname -s | tr [[:upper:]] [[:lower:]])
	set -U CONFIGURED true
end

source $DOT/.variables
source $DOT/.functions
source $DOT/.aliases
source $DOT/.config
source $DOT/.env
