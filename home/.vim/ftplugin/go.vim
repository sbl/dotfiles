setl makeprg=go\ build\ \"%:p\" |

nnoremap <F6> :!go run %<CR>
nnoremap <F12> :!go test<CR>

setlocal noet ts=4 sw=4 sts=4

au BufWritePre <buffer> Fmt
