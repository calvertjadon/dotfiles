#!/usr/bin/env bash


# install nodejs
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt install -y nodejs

# install other deps
sudo apt install -y git stow ripgrep fd-find fzf

git submodule init
git submodule update

stow .
