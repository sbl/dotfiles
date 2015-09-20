"let g:haskellmode_completion_ghc = 0
setlocal nofoldenable

nnoremap <F5>   :w<CR>:!stack build<CR>
nnoremap <F6>   :w<CR>:!stack runghc %:p<CR>
nnoremap <F12>  :w<CR>:GhcModCheckAndLintAsync<CR>
