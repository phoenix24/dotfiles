if [ -d .dotfiles ]; then
    echo "\033[31m  dotfiles already installed!"
    exit
fi  

echo "\033[0;34mCloning Dotfiles...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/phoenix24/dotfiles.git ~/.dotfiles || {
  echo "\033[31m git not installed"
  exit
}

if [ -f ~/.zshrc ]; then
  echo "\033[33m Updating .zshrc ..."
  echo "                                       " >> ~/.zshrc
  echo "                                       " >> ~/.zshrc
  echo "# adding csharmarc                     " >> ~/.zshrc
  echo "if [ -f ~/.dotfiles/.csharmarc ]; then " >> ~/.zshrc
  echo "  source ~/.dotfiles/.csharmarc        " >> ~/.zshrc
  echo "fi                                     " >> ~/.zshrc
  echo "                                       " >> ~/.zshrc
  echo "                                       " >> ~/.zshrc
fi

if [ -f ~/.bashrc ]; then
  echo "\033[33m Updating .bashrc ..."
  echo "                                       " >> ~/.bashrc
  echo "                                       " >> ~/.bashrc
  echo "# adding csharmarc                     " >> ~/.bashrc
  echo "if [ -f ~/.dotfiles/.csharmarc ]; then " >> ~/.bashrc
  echo "  source ~/.dotfiles/.csharmarc        " >> ~/.bashrc
  echo "fi                                     " >> ~/.bashrc
  echo "                                       " >> ~/.bashrc
  echo "                                       " >> ~/.bashrc
fi

echo "\033[32m"
echo "\033[32m creating symlinks for .gitconfig"
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig 

echo "\033[32m creating symlinks for .gitignore"
ln -sf ~/.dotfiles/gitignore ~/.gitignore

echo "\033[32m creating symlinks for .gitignore_global"
ln -sf ~/.dotfiles/gitignore_global ~/.gitignore_global

echo "\033[32m creating symlinks for .emacs"
ln -sf ~/.dotfiles/emacs ~/.emacs

echo "\033[32m creating symlinks for .irssi"
ln -sf ~/.dotfiles/irssi ~/.irssi

echo "\033[32m creating symlinks for .curlrc"
ln -sf ~/.dotfiles/curlrc ~/.curlrc 

echo "\033[32m creating symlinks for .vimrc"
ln -sf ~/.dotfiles/screenrc ~/.vimrc

echo "\033[32m creating symlinks for .wgetrc"
ln -sf ~/.dotfiles/screenrc ~/.wgetrc

echo "\033[32m creating symlinks for .screenrc"
ln -sf ~/.dotfiles/screenrc ~/.screenrc

echo "\033[32m creating symlinks for .editorconfig"
ln -sf ~/.dotfiles/editorconfig ~/.editorconfig

echo "\033[32m Dotfiles installed + updated successfully! parrrrty!"
echo "\033[32m You may want to restart the shell :D"
echo "\033[32m "
