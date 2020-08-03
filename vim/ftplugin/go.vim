" go

let g:go_imports_autosave = 1
let g:go_gopls_enabled = 0

setl nolist
command! -bang A call go#alternate#Switch(<bang>0, 'edit')
