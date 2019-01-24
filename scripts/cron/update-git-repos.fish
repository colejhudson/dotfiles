#!/usr/bin/env fish

set -l ROOT $HOME/.work/src/contributions

for dir in $ROOT/*
	cd $dir
	set -l REPO (basename $dir)
	set -l DATE (date)
	set -l MSG "\
	$DATE: Updated '$REPO' succesfully.\n
	 * Gitlab: https://gitlab.com/colejhudson/$REPO\n
	 * Github: https://github.com/colejhudson/$REPO"

	git pull public master; and \
  git push private master; and \
  echo -e $MSG | cole@colejhudson.com
end
