# environment variables

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

set -x GOPATH $HOME

set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

set -g -x PIP_REQUIRE_VIRTUALENV true

# LLVM
if test "arm64" = (uname -m)
  set -pgx LDFLAGS "-L/opt/homebrew/lib -L/usr/local/lib"
  set -pgx CPPFLAGS "-I/opt/homebrew/include -I/usr/local/include"
  set -pgx CFLAGS "-I/opt/homebrew/include -I/usr/local/include"

  set -gx CPATH /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include
else
  set -gx LDFLAGS "-L/usr/local/opt/llvm@14/lib"
  set -gx CPPFLAGS "-I/usr/local/opt/llvm@14/include"
end

# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# aliases

alias l='ls -lFh'
alias ll='ls -alF'

alias vim=nvim
alias vi=nvim

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish
