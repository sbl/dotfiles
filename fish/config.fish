# environment variables

set -x GOPATH $HOME
set -x WORKON $HOME/.virtualenvs

function _setup_environment
  # -U set this universally and persists the setting
  echo "… configuring environment …"
  set -U EDITOR nvim
  set -U VISUAL nvim
  set -U PAGER less
end

# path

set -gx PATH \
  $GOPATH/bin \
  $PATH

# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# aliases

alias l='ls -lFh'
alias ll='ls -alF'
alias vi=nvim
alias vim=nvim
alias gll='git log --graph --pretty=format:"%C(bold red)%h%C(reset)%C(yellow)%d%C(reset) %C(red)(%cr)%C(reset) %s — %C(blue)%ae%C(reset)" --abbrev-commit'
