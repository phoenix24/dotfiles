if [ -d .dotfiles ]; then
    echo "dotfiles already installed!"
    exit
fi  

echo "\033[0;34mCloning Dotfiles...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/phoenix24/dotfiles.git ~/.dotfiles || {
  echo "git not installed"
  exit
}

if [ -f ~/.zshrc ]; then
  echo "updating ~/.zshrc"  
fi

if [ -f ~/.bashrc ]; then
  echo "updating ~/.bashrc"
fi

echo "Dotfiles installed + updated successfully! parrrrty!"
echo "You may want to restart the shell :D"

