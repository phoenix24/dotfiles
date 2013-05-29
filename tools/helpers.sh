#!/bin/sh

# helper function here!


# reload all.
function reload_dotfiles {
    echo "\033[32m Reloading Dotfiles ..."
    source $DOTFILES/.csharmarc
}


# update dotfiles.
function update_dotfiles {
    echo "\033[32m Updating Dotfiles ..."
    
    # stash away old dir.
    OLD_DIR=`pwd`
    
    cd $DOTFILES

    if git pull origin master
    then
	echo "Yeppie! Dotfiles Updated!"
    else 
	echo "No Updates!"
    fi

    # restore back to user dir
    cd $OLD_DIR
}
