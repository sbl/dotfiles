#!/bin/sh

read -p "Linking to your '~'. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  find $PWD -mindepth 1 -prune \
    -name '.*' \
    ! -iname '.git' \
    ! -iname '.DS_Store' \
    -exec ln -is {} $HOME \;
fi;
