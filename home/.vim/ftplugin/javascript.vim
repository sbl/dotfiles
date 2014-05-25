if filereadable(expand("%:p:h")."/Makefile")
  " jshint
  set efm+=
    \%-G\ ,
    \%-G\make:%m,
    \%f:\ line\ %l\\,\ col\ %c\\,\ %m

  nnoremap <F6> :!make run<CR>
  nnoremap <F12> :!make test<CR>
endif
