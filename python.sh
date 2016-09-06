#!/usr/bin/env bash

# bootstrap a python environment to work with neovim.

py2=2.7.12
py3=3.5.2

echo "installing pyenv"
brew install pyenv

echo "installing py2 + py3"
env PYTHON_CONFIGURE_OPTS="--enable-framework CC=clang" pyenv install $py2
env PYTHON_CONFIGURE_OPTS="--enable-framework CC=clang" pyenv install $py3

echo "setting up virtualenvs"
pyenv virtualenv $py2 neovim2
pyenv virtualenv $py3 neovim3

eval "$(pyenv init -)"

echo "installing packages for neovim2"
pyenv shell neovim2
pip install -qU pip neovim flake8

echo "installing packages for neovim3"
pyenv shell neovim3
pip install -qU pip neovim flake8

echo "done"
pyenv shell --unset
