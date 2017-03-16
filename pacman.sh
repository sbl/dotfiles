#!/bin/sh

# install commonly used packages to get up a running environment

set -e

command -v pacaur >/dev/null 2>&1 || { echo >&2 "Please install pacaur https://github.com/rmarquis/pacaur. Aborting."; exit 1; }

# environment
pacaur -S terminator
pacaur -S i3-gaps-git
pacaur -S fish
pacaur -S neovim
pacaur -S ranger # file manager
pacaur -S sxiv # image viewer

# languages
pacaur -S go
pacaur -S python
pacaur -S nodejs

# apps
pacaur -S chromium
# pacaur -S firefox
# pacaur -S libreoffice-still

# fonts
pacaur -S siji-git
pacaur -S adobe-source-code-pro-fonts
pacaur -S ttf-ms-fonts
pacaur -S ttf-google-fonts-git
pacaur -S bdf-tewi-git
