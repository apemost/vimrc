#!/usr/bin/env bash

git pull origin main

rsync -avh --no-perms vimrc ~/.vimrc
rsync -avh --no-perms --exclude .DS_Store vim/* ~/.vim/
