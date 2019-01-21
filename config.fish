#!/usr/bin/env fish

set ROOT $HOME/.(whoami)
set SRC $ROOT/src
set ETC $ROOT/etc
set DOT $ROOT/dotfiles

source $DOT/.variables
source $DOT/.functions
source $DOT/.aliases
source $DOT/.config
source $DOT/.env

if test $CONFIGURED; and status --is-interactive
	source $DOT/.(uname -s)
	set -U CONFIGURED true
end
