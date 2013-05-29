#!/bin/sh


function update_dotfiles {
    echo "updating dotdiles!"
    cd $DOTFILES

    if git pull origin master
    then
	echo "Yeppie! Dotfiles Updated!"
    else 
	echo "No Updates!"
    fi
}
