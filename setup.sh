#!/bin/sh

cd $HOME
# install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ln -s dotfiles/Brewfile
# install brew bundle
brew tap Homebrew/bundle
# change default shell to zsh
chsh -s /usr/local/bin/zsh
brew bundle

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# ** link dotfiles **
ln -s dotfiles/.zpreztorc
ln -s dotfiles/.zsh.after
ln -s dotfiles/.zshrc
