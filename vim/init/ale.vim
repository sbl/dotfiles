let g:ale_disable_lsp = 1
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_cursor_detail = 0
let g:ale_virtualtext_cursor = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '‼'
let g:ale_sign_info = 'ℹ'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}

nnoremap <leader>ö :ALEPreviousWrap<CR>
nnoremap <leader>ä :ALENextWrap<CR>

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cmake': ['cmakeformat'],
\   'cpp': ['clang-format'],
\   'css': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'python': ['black', 'isort'],
\   'rust': ['rustfmt'],
\   'typescript': ['prettier'],
\}
