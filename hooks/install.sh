#!/usr/bin/env bash

base=$(git rev-parse --show-cdup)

for hook in pre-commit; do
  cp ${base:-.}/hooks/$hook ${base:-.}/.git/hooks/$hook
done
