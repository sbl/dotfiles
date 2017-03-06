#!/bin/sh

hash stow 2> /dev/null || echo "please install `stow` first"

stow -vv -t $HOME fish
stow -vv -t $HOME neovim
stow -vv -t $HOME misc
