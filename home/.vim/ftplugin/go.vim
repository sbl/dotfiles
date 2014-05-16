setl noet ts=4 sw=4 sts=4
setl nolist

nnoremap <F5> :GoBuild <CR>
nnoremap <F6>  :GoRun<CR>
nnoremap <F12> :!go test ./%:h<CR>
