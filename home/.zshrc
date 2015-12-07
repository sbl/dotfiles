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

alias vi=nvim
alias vim=nvim

# thanks to attila!
alias gll='git log --graph --pretty=format:"%C(bold red)%h%C(reset)%C(yellow)%d%C(reset) %C(red)(%cr)%C(reset) %s — %C(blue)%ae%C(reset)" --abbrev-commit'
alias dockrm='docker rm $(docker ps -aqf status=exited)'
alias dockrmi='docker rmi $(docker images -q -f dangling=true)'
alias dco=docker-compose

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
BASE16_SHELL="$HOME/.config/base16-shell/base16-flat.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
