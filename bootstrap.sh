#!/usr/bin/env bash

git pull origin master

rsync \
  --exclude '.git' \
  --exclude '.DS_Store' \
  --exclude '.travis.yml' \
  --exclude 'LICENSE' \
  --exclude 'README.md' \
  --exclude 'bootstrap.sh' \
  -avh --no-perms . ~
