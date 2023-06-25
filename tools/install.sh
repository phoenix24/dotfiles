if [ -d .dotfiles ]; then
    echo "\033[31m  dotfiles already installed!"
    exit
fi  

echo "\033[0;34mCloning Dotfiles...\033[0m"
hash git >/dev/null && /usr/bin/env git clone git@github.com:phoenix24/dotfiles.git ~/.dotfiles || {
  echo "\033[31m git not installed"
  exit
}

# import helper functions
source ~/.dotfiles/tools/helpers.sh

echo "\033[32m dotfiles installed, updating shell!"
dotfiles update-shell

echo "\033[32m dotfiles installed, creating configs!"
dotfiles update-configs

echo "\033[32m dotfiles installed + updated successfully! parrrrty!"
echo "\033[32m you may want to restart the shell :D"
echo "\033[32m "
