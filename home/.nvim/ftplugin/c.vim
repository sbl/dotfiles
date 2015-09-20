if !filereadable(expand("%:p:h")."/Makefile")
  setlocal makeprg=clang\ -Wall\ -Wextra\ -o\ %<\ %
endif
