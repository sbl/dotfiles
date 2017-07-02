# environment variables

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x GOPATH $HOME
set -x WORKON $HOME/.virtualenvs

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

# path

set -gx PATH \
  $GOPATH/bin \
  ~/google-cloud-sdk/bin \
  ~/.local/bin \
  $PATH

# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# extend the environment

if command -s hub >> /dev/null
  eval (hub alias -s)
else
  echo '`hub` is not installed'
end

set -l PYTHON_EXE /usr/local/bin/python3
if command -s $PYTHON_EXE >> /dev/null
  eval (eval $PYTHON_EXE -m virtualfish auto_activation)
else
  echo '`virtualfish` is not properly installed'
end

# aliases

alias l='ls -lFh'
alias ll='ls -alF'
alias vi=nvim
alias vim=nvim
alias gll='git log --graph --pretty=format:"%C(bold red)%h%C(reset)%C(yellow)%d%C(reset) %C(red)(%cr)%C(reset) %s — %C(blue)%ae%C(reset)" --abbrev-commit'
