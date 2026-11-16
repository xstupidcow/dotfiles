#!/usr/bin/env bash

# List all directories
projects=$(ls -d ~/projects/*)

# Select a directory using FZF
selected=$(printf "$projects" | fzf)

if [ -z "$selected" ]; then
  echo 'No project selected'
  exit 1
fi

cd "$selected"
$SHELL
