#!/usr/bin/env bash

has_uncommitted_changes() {
  [[ -n "$(git status --porcelain --untracked-files=no 2>/dev/null)" ]]
}

if has_uncommitted_changes; then
  echo "Skipped git pull because there are uncommitted changes."
else
  git pull origin main
fi

rsync -avh --no-perms vimrc ~/.vimrc
rsync -avh --no-perms --exclude .DS_Store vim/* ~/.vim/

mkdir -p ~/.config/nvim
rsync -avh --no-perms --exclude .DS_Store nvim/ ~/.config/nvim/
