#!/usr/bin/env bash

packagelist=dependencies.txt

xargs -a <(awk '! /^ *(#|$)/' "$packagelist") -r -- sudo apt-get install

git submodule init
git submodule update

stow .
