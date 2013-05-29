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
  echo "updating ~/.zshrc ..."
  echo "#######################################" >> ~/.zshrc
  echo "#######################################" >> ~/.zshrc
  echo "# adding csharmarc                     " >> ~/.zshrc
  echo "if [ -f ~/.dotfiles/.csharmarc ]; then " >> ~/.zshrc
  echo "  source ~/.dotfiles/.csharmarc        " >> ~/.zshrc
  echo "fi                                     " >> ~/.zshrc
  echo "#######################################" >> ~/.zshrc
  echo "#######################################" >> ~/.zshrc
fi

if [ -f ~/.bashrc ]; then
  echo "updating ~/.bashrc"
  echo "#######################################" >> ~/.bashrc
  echo "#######################################" >> ~/.bashrc
  echo "# adding csharmarc                     " >> ~/.bashrc
  echo "if [ -f ~/.dotfiles/.csharmarc ]; then " >> ~/.bashrc
  echo "  source ~/.dotfiles/.csharmarc        " >> ~/.bashrc
  echo "fi                                     " >> ~/.bashrc
  echo "#######################################" >> ~/.bashrc
  echo "#######################################" >> ~/.bashrc
fi

echo "Dotfiles installed + updated successfully! parrrrty!"
echo "You may want to restart the shell :D"

