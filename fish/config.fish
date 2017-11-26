# environment variables

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x GOPATH $HOME

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x CONDA_LEFT_PROMPT 1

# path
# instead of setting paths via configs (less portable) use fish_user_paths
# http://fishshell.com/docs/current/tutorial.html#tut_path
# > set -U fish_user_paths /usr/local/bin $fish_user_paths

# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# aliases

alias l='ls -lFh'
alias ll='ls -alF'
alias vi=nvim
alias vim=nvim

# py oh my
source $HOME/miniconda3/etc/fish/conf.d/conda.fish
