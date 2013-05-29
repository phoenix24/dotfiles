#!/bin/sh

echo "updating dotdiles!"
cd ~/.dotfiles

if git pull origin master
then
    echo "Yeppie! Dotfiles Updated!"
else 
    echo "No Updates!"
fi