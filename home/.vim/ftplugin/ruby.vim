if expand("%") =~# '_spec\.rb$' |
  compiler rspec | setl makeprg=rspec\ $*|
else |
  compiler ruby | setl makeprg=ruby\ -w\ \"%:p\" |
endif

" better specing
nnoremap <F6>  :call RunCurrentSpecFile()<CR>
nnoremap <F7>  :call RunNearestSpec()<CR>
nnoremap <F8>  :call RunLastSpec()<CR>
nnoremap <F12> :call RunAllSpecs()<CR>
