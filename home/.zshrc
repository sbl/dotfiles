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

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

alias vi=vim

# thanks to attila!
alias gll='git log --graph --pretty=format:"%C(bold red)%h%C(reset)%C(yellow)%d%C(reset) %C(red)(%cr)%C(reset) %s — %C(blue)%ae%C(reset)" --abbrev-commit'
alias dockrm='docker rm $(docker ps -aqf status=exited)'
alias dockrmi='docker rmi $(docker images -q -f dangling=true)'
alias dock='$(boot2docker shellinit)'

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
