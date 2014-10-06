setl noet ts=4 sw=4 sts=4
setl nolist

let g:go_fmt_command = "goimports"

" key is key
nmap gd <Plug>(go-def)
nmap K <Plug>(go-doc)

nmap <F5> <Plug>(go-build)
nmap <F6> <Plug>(go-run)
nmap <F12> <Plug>(go-test)
