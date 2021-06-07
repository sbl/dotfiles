# environment variables

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x GOPATH $HOME

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

#set -x CTEST_OUTPUT_ON_FAILURE 1
set -x CMAKE_EXPORT_COMPILE_COMMANDS 1

set -x AWS_CREDENTIALS_PATH $HOME/.phrase/config.json

# LLVM
if test "arm64" = (uname -m)
  set -px LDFLAGS "-L/opt/homebrew/lib"
  set -px CPPFLAGS "-I/opt/homebrew/include"
else
  set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
  set -gx CPPFLAGS "-I/usr/local/opt/llvm/include -I/usr/local/include"
end


# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# aliases

alias l='ls -lFh'
alias ll='ls -alF'

alias vim=nvim
alias vi=nvim
