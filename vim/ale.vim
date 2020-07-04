" ale

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

let g:ale_close_preview_on_insert = 1

" neovim only
let g:ale_virtualtext_cursor = 0

let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 0
let g:ale_linters_explicit = 1

let g:ale_linters = {
      \   'c': ['clangd'],
      \   'cpp': ['clangd'],
      \   'go': ['gopls'],
      \   'lua': ['luacheck'],
      \   'javascript': [],
      \   'typescript': ['tsserver'],
      \   'python': ['pyls', 'mypy'],
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'c': ['clang-format'],
      \   'cpp': ['clang-format'],
      \   'go': ['gofmt'],
      \   'javascript': ['prettier'],
      \   'python': ['isort', 'black'],
      \   'scss': ['prettier'],
      \   'typescript': ['prettier'],
      \   'typescriptreact': ['prettier'],
      \}


" keys
nmap <f3> :lopen<CR>

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\ 'smart_case': v:true,
\ 'sources': {
\   '_': ['ale', 'buffer'],
\ },
\ })


inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

nmap <leader>ö <Plug>(ale_previous)
nmap <leader>ä <Plug>(ale_next)

" TODO trigger on active LSP server, no callback?
augroup alekeys
  au!

  au FileType typescript,c,cpp,python nmap <buffer> gd <plug>(ale_go_to_definition)
  au FileType typescript,c,cpp,python nmap <buffer> <f2> :ALERename<CR>
  au FileType typescript,c,cpp,python nmap <buffer> K <plug>(ale_hover)
augroup END

" helpers

function! AleStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '' : printf(
    \   '| %dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
