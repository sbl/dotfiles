# environment variables

set -x GOPATH $HOME
set -x WORKON $HOME/.virtualenvs

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

# path

set -gx PATH \
  $GOPATH/bin \
  ~/google-cloud-sdk/bin \
  ~/Library/Haskell/bin \
  $PATH

# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# aliases

alias l='ls -lFh'
alias ll='ls -alF'
alias vi=nvim
alias vim=nvim
alias gll='git log --graph --pretty=format:"%C(bold red)%h%C(reset)%C(yellow)%d%C(reset) %C(red)(%cr)%C(reset) %s — %C(blue)%ae%C(reset)" --abbrev-commit'
