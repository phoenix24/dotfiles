#!/bin/sh

# helper function here!
function __auto_complete {
    reply=(update home status reload edit list)
}

# main funtion, i do all the tricks.
function dotfiles {
    if [[ $# == 0 ]]; then
        echo "\033[31m usage : dotfiles -h"
        echo "\033[32m $ dotfiles \033[33m nuke    "
        echo "\033[32m $ dotfiles \033[33m list    "
        echo "\033[32m $ dotfiles \033[33m update  "
        echo "\033[32m $ dotfiles \033[33m status  "
        echo "\033[32m $ dotfiles \033[33m edit <helper|alias|paths>  "
        echo "\033[32m $ dotfiles \033[33m reload [helper|alias|paths]"
        return 1

    elif [[ $1 == "update" ]]; then
        __update_dotfiles

    elif [[ $1 == "home" ]]; then
        __home_dotfiles

    elif [[ $1 == "status" ]]; then
        __status_dotfiles
    
    elif [[ $1 == "reload" ]]; then
        __reload_dotfiles
    
    elif [[ $1 == "edit" ]]; then
        if [[ $2 == "helper" || $2 == "alias" || $2 == "paths" ]]; then
            echo "opening $2 for edits"
        else
            echo "only [helper|alias|paths] can be edited."
        fi    

    elif [[ $1 == "list" ]]; then
        __list_dotfiles        
    fi
}

# goto dotfiles home.
function __home_dotfiles {
    echo "\033[32m Home Dotfiles ..."
    cd $DOTFILES
}

# list all.
function __list_dotfiles {
    echo "\033[32m Status Dotfiles ..."
}

# status all.
function __status_dotfiles {
    echo "\033[32m Status Dotfiles ..."
    echo "\033[33m Doftiles : "
    zsh_stats
}

# reload all.
function __reload_dotfiles {
    echo "\033[32m Reloading Dotfiles ..."
    source $DOTFILES/.csharmarc
}

# update dotfiles.
function __update_dotfiles {
    echo "\033[32m Updating Dotfiles ..."
    
    # stash away old dir.
    local OLD_DIR=`pwd`
    
    cd $DOTFILES

    if git pull origin master
    then
	echo "Yeppie! Dotfiles Updated!"
    else 
	echo "No Updates!"
    fi
    
    # reload settings.
    __reload_dotfiles
    
    # restore back to user dir
    cd $OLD_DIR
}

# for me lazy, alias to main.
function dt {
    dotfiles $@
}

# Note: with a static list of auto-complete commands :
# compctl -k "(cmd1 cmd2 cmd3)" command

# Note: with a dynamic list of auto-complete commands :
# compctl -K __your_fancy_function command

# add dotfiles autocomplete.
compctl -K __auto_complete dt
compctl -K __auto_complete dotfiles
