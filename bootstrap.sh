#!/usr/bin/env bash

has_uncommitted_changes() {
  [[ -n "$(git status --porcelain --untracked-files=no 2>/dev/null)" ]]
}

if has_uncommitted_changes; then
  echo "Skipped git pull because there are uncommitted changes."
else
  git pull origin main
fi

confirm_sync() {
  local label="$1"
  local target="$2"
  local reply

  printf "Sync %s to %s? [y/N] " "$label" "$target"
  if ! IFS= read -r reply; then
    echo
    return 1
  fi
  [[ "$reply" =~ ^[Yy]$ ]]
}

if confirm_sync "vim" "~/.vim/"; then
  rsync -avh --no-perms vimrc ~/.vimrc
  rsync -avh --no-perms --exclude .DS_Store vim/* ~/.vim/
else
  echo "Skipped vim sync."
fi

if confirm_sync "nvim" "~/.config/nvim/"; then
  rsync -avh --no-perms --exclude .DS_Store nvim/ ~/.config/nvim/
else
  echo "Skipped nvim sync."
fi
