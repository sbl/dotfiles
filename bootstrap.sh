#!/bin/sh

set -e

mkdir -p $HOME/.config/{fish,nvim}

stow -vv -t $HOME/.config/fish fish
stow -vv -t $HOME/.config/nvim nvim
stow -vv -t $HOME/bin bin
stow -vv -t $HOME misc
