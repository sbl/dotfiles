" go

let g:go_imports_autosave = 1
let g:go_gopls_enabled = 0
let g:go_list_height = 10

setl nolist
command! -bang A call go#alternate#Switch(<bang>0, 'edit')

nnoremap <F4> :GoTest<CR>
nnoremap <F5> :GoBuild<CR>
