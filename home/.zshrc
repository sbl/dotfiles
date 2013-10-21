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

alias srs='spring rails'
alias srk='spring rake'
alias clean_slate='rake db:drop db:create db:migrate db:seed db:test:prepare'

autoload -U zmv

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
