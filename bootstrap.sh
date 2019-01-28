#!/usr/bin/env bash

git pull origin master

rsync -avh --no-perms vimrc
rsync -avh --no-perms --exclude .DS_Store vim ~/.vim
