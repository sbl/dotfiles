#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  if ! [[ -d $HOME/.zprezto ]]; then
    git clone git@github.com:sbl/prezto.git $HOME/.zprezto
  fi;

  find $PWD -mindepth 1 -prune \
    -name '.*' \
    ! -iname '.git' \
    ! -iname '.DS_Store' \
    -exec ln -is {} $HOME \;

  zsh ~/.zprofile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "Linking to your '~'. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
