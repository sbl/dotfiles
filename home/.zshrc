#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias vi=vim

setopt AUTO_PUSHD
autoload -U zmv

$(boot2docker shellinit 2> /dev/null)

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
