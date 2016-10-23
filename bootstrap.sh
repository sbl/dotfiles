#!/usr/bin/env bash

if [ ! -d "$HOME/.zplug" ]; then
  git clone https://github.com/zplug/zplug.git $HOME/.zplug
fi

read -p "Linking to your '~'. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  find $PWD -mindepth 1 -prune \
    -name '.*' \
    ! -iname '.git' \
    ! -iname '.DS_Store' \
    -exec ln -is {} $HOME \;

  zsh ~/.zshenv;
fi;
