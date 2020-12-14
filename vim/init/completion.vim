" completion config

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

let g:completion_auto_change_source = 1
let g:completion_enable_auto_popup = 0
let g:completion_enable_auto_hover = 0
let g:completion_enable_auto_signature = 0


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
