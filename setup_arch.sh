#!/bin/sh

hash stow 2> /dev/null || echo "please install `stow` first"

stow -vv -t $HOME neovim
stow -vv -t $HOME misc
stow -vv -t $HOME i3
stow -vv -t $HOME termite
