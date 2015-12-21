#!/bin/sh

cd $HOME

echo "start setup"

# install Homebrew
if ! [ -e /usr/local/bin/brew ]; then
  echo "\tinstall Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "\tset slink Brewfile"
  ln -s dotfiles/Brewfile

  echo "\ttap Homebrew/bundle"
  brew tap Homebrew/bundle
  # change default shell to zsh
  chsh -s /usr/local/bin/zsh
fi

echo "\tinstall brew packages"
brew bundle

if ! [ -e ${ZDOTDIR:-$HOME}/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  ln -s dotfiles/.zpreztorc
  ln -s dotfiles/.zsh.after
  ln -s dotfiles/.zshrc
fi

# ** link dotfiles **
for file in .zpreztorc .zshrc
do
  if ! [ -L "${ZDOTDIR:-$HOME}/$file" ]; then
    echo "\tlink dotfiles"
    ln -s "dotfiles/${file}"
  fi
done

# ** anyenv settings **
if ! [ $(echo $PATH | grep anyenv) ]; then
  echo "\tclone anyenv"
  git clone https://github.com/riywo/anyenv ~/.anyenv

  echo "\tanyenv initial settings"
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/dotfiles/.zshrc
  echo 'eval "$(anyenv init -)"' >> ~/dotfiles/.zshrc
fi

echo "finish setup"
