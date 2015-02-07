setlocal omnifunc=necoghc#omnifunc
setlocal nofoldenable

nnoremap <F5> :!ghc --make %:p<CR>
nnoremap <F6> :!runhaskell %:p<CR>
nnoremap <F12> :GhcModCheckAndLintAsync<CR>
