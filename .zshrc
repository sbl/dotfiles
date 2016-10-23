BASE16_SHELL="$HOME/.config/base16-shell/base16-flat.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

PURE_PROMPT_SYMBOL=♫

# zplug

source ~/.zplug/init.zsh
zplug "modules/environment", from:prezto
zplug "modules/history", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/utility", from:prezto
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

zplug load

# config

fpath=(/usr/local/share/zsh-completions $fpath)
autoload zmv

# alias

alias vi=nvim
alias vim=nvim
# thanks to attila!
alias gll='git log --graph --pretty=format:"%C(bold red)%h%C(reset)%C(yellow)%d%C(reset) %C(red)(%cr)%C(reset) %s — %C(blue)%ae%C(reset)" --abbrev-commit'

# pyenv

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# paths

source "$HOME/google-cloud-sdk/path.zsh.inc"
source "$HOME/google-cloud-sdk/completion.zsh.inc"
