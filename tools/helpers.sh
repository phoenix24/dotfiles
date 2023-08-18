#!/bin/sh

# setup dotfiles.
export OS=`uname`
export DOTFILES="$HOME/.dotfiles"

# helper function here!
function __auto_complete {
    reply=(update home status reload edit list)
}

# main funtion, i do all the tricks.
function dotfiles {
    if [[ $# == 0 ]]; then
        echo "\033[31m usage: dotfiles -h"
        echo "\033[32m   $ dotfiles \033[33m home    "
        echo "\033[32m   $ dotfiles \033[33m nuke    "
        echo "\033[32m   $ dotfiles \033[33m list    "
        echo "\033[32m   $ dotfiles \033[33m pull"
        echo "\033[32m   $ dotfiles \033[33m status  "
        echo "\033[32m   $ dotfiles \033[33m update-all"
        echo "\033[32m   $ dotfiles \033[33m update-shell"
        echo "\033[32m   $ dotfiles \033[33m update-configs"
        echo "\033[32m   $ dotfiles \033[33m edit <helper|alias|paths>  "
        echo "\033[32m   $ dotfiles \033[33m reload [helper|alias|paths]"
        return 1

    elif [[ $1 == "home" ]]; then
        __home_dotfiles

    elif [[ $1 == "status" ]]; then
        __status_dotfiles
    
    elif [[ $1 == "reload" ]]; then
        __reload_dotfiles
    
    elif [[ $1 == "edit" ]]; then
	__edit_dotfiles $2

    elif [[ $1 == "list" ]]; then
        __list_dotfiles

    elif [[ $1 == "pull" ]]; then
        __update_repo
	
    elif [[ $1 == "update-all" ]]; then
        __update_repo
        __update_zshrc
        __update_bashrc
        __update_configs
	
    elif [[ $1 == "update-shell" ]]; then
        __update_zshrc
        __update_bashrc
	
    elif [[ $1 == "update-configs" ]]; then
        __update_configs

    else 
	# invalid command, invoking help.
	dotfiles
    fi
}

function __home_dotfiles {
    echo "\033[32m Home Dotfiles ..."
    cd $DOTFILES
}

function __list_dotfiles {
    echo "\033[32m Status Dotfiles ..."
}

function __edit_dotfiles {
    echo "opening '$1' for edits"
    if [[ $1 == "alias" ]]; then
	emacs $DOTFILES/tools/alias.sh
    
    elif [[ $1 == "helper" ]]; then
	emacs $DOTFILES/tools/helpers.sh
    else
        echo "invalid dotfile edit argument"
    fi

    # reload settings.
    __reload_dotfiles
}

# status all.
function __status_dotfiles {
    echo "\033[32m Status Dotfiles ..."
    echo "\033[33m Doftiles : "
    zsh_stats
}

function __reload_dotfiles {
    echo "\033[32m reloading dotfiles ..."
    source $DOTFILES/tools/alias.sh
}


function __update_zshrc {
    echo "\033[32m updating zshrc ..."
    if [ -f ~/.zshrc ]; then
	echo "\033[33m Updating .zshrc ..."
	echo "                                       " >> ~/.zshrc
	echo "source ~/.dotfiles/tools/alias.sh      " >> ~/.zshrc
	echo "                                       " >> ~/.zshrc
    fi
}

function __update_bashrc {
    echo "\033[32m updating bashrc ..."
    if [ -f ~/.zshrc ]; then
	echo "\033[33m Updating .bashrc ..."
	echo "                                       " >> ~/.bashrc
	echo "source ~/.dotfiles/tools/alias.sh      " >> ~/.bashrc
	echo "                                       " >> ~/.bashrc
    fi
}

function __update_repo {
    echo "\033[32mupdating dotfiles ..."
    
    # stash away old dir.
    local OLD_DIR=`pwd`
    
    cd $DOTFILES

    if git pull --rebase
    then
	echo "* yeppie! dotfiles updated!"
    else 
	echo "* no updates!"
    fi
    
    # reload settings.
    __reload_dotfiles
    
    # restore back to user dir
    cd $OLD_DIR
}

# create config symlinks
function __update_configs {
    echo "\033[32m creating config symlinks ..."
    echo "\033[32m"

    for file in `ls $DOTFILES/configs`
    do
	echo "\033[32m creating symlinks for .$file"
	ln -sf $DOTFILES/configs/$file $HOME/.$file
    done

    # reload settings.
    __reload_dotfiles    
}

