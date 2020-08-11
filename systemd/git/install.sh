#!/usr/bin/env bash

set -euo pipefail

function die {
  echo "error $@"
  exit 1
}

echo "configuring git"

# Ensure that git-shell exists
if [[ -z $(which git-shell) ]]; then
  die "couldn't find git-shell"
fi

# Add git-shell to /etc/shells
gitshell=$(which git-shell)
if [[ ! $(cat /etc/shells | grep $gitshell) ]]; then
  sudo echo $(which git-shell) > /etc/shells
fi

# Create 'git' user and group
if [[ -z $(getent passwd git) ]]; then
  sudo useradd \
    --system \
    --shell $gitshell \
    --user-group \
    --comment "git" \
    git || true

  sudo usermod -L git
fi

# Add git commands
gitcmds=$(getent passwd git | cut -d ':' -f 6)/git-shell-commands/
sudo --set-home --user=git bash -c "mkdir -p $gitcmds"

base=$(git rev-parse --show-cdup)
for source in $(realpath ${base:-.}/services/git/git-shell-commands)/*; do
  sudo install -g git -o git $source $gitcmds
done

echo 'success!'
