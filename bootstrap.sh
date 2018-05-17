#!/usr/bin/env bash

git pull origin master

rsync \
  --exclude '.git' \
  --exclude '.DS_Store' \
  --exclude '.travis.yml' \
  --exclude '.vimrc.preload' \
  --exclude '.vimrc.afterload' \
  --exclude 'LICENSE' \
  --exclude 'README.md' \
  --exclude 'bootstrap.sh' \
  --exclude 'assets' \
  -avh --no-perms . ~
