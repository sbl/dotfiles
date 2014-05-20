setl noet ts=4 sw=4 sts=4
setl nolist

" key is key
nmap gd <Plug>(go-def)
nmap K <Plug>(go-doc)

nmap <F5> <Plug>(go-build)
nmap <F6> <Plug>(go-run)
nmap <F12> :!go test ./...<CR>
