# environment variables

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x GOPATH $HOME

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

set -x FZF_DEFAULT_COMMAND 'ag -g ""'

# path

set -gx PATH \
  ~/miniconda3/envs/py27/bin \
  $GOPATH/bin \
  ~/.cargo/bin \
  ~/google-cloud-sdk/bin \
  ~/.local/bin \
  $PATH

# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# aliases

alias l='ls -lFh'
alias ll='ls -alF'
alias vi=nvim
alias vim=nvim

# py oh my
source ~/miniconda3/etc/fish/conf.d/conda.fish
