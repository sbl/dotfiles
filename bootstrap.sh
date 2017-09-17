#!/bin/sh

set -e

mkdir -p $HOME/.config/fish

stow -v2 --ignore 'fishd.*' -t $HOME/.config/fish fish
stow -v2 -t $HOME vim
stow -v2 -t $HOME misc
