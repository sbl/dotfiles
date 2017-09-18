"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

call plug#begin('~/.vim/plugged')

" core

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'lifepillar/vim-solarized8'

" IDE

Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-peekaboo'
Plug 'lifepillar/vim-mucomplete'
Plug 'w0rp/ale'

" interface

Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" language

Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

filetype on
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

" reload when saving this
autocmd! BufWritePost .vimrc source ~/.vimrc

set history=10000
set wildmode=list:longest,full
set autoread

let mapleader = ","
let g:mapleader = ","

set showcmd     "show incomplete cmds down the bottom
set smartcase   "be smart when searching
set nohlsearch
set ignorecase
set wildignore+=*/tmp/*,*/cache/*,*/dist/*,*.so,*.swp,*.zip,*.pyc
set completeopt+=menuone " mu complete wants this

set nonumber
set foldcolumn=0
set nowrap

" display hidden characters
set listchars=tab:▸\ ,nbsp:•,trail:…
set list

" comment formatting help
set tw=78
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set nobackup
set noswapfile
set nowritebackup

set hidden "allow me to switch unsaved buffers
set splitbelow
set splitright

set shortmess+=c   " Shut off completion messages
set vb " disable error bell
set kp=:help    " I barely need a man output

set t_Co=256
let g:solarized_statusline="normal"
colorscheme solarized8_dark_flat

set mouse=a
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" make thin splits
hi VertSplit guibg=bg ctermbg=bg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

" ale

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '%linter% - %s'

let g:ale_linters = {
\   'javascript': ['flow', 'eslint'],
\   'go': ['go build', 'golint']
\}

let g:ale_fixers = {}
let g:ale_fixers.python = ['yapf', 'isort']

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" NERDTree

let NERDTreeIgnore=['\.pyc$']
let g:NERDTreeMinimalUI = 1

" RAGTAG

let g:ragtag_global_maps = 1

" COMPLETION

let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

inoremap <silent> <plug>(MUcompleteFwdKey) <right>
imap <expr> <right> <plug>(MUcompleteCycFwd)

let g:peekaboo_ins_prefix = '<c-x>' " mucomplete complains
" close preview window
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" CTRLP
let g:ctrlp_root_markers = ['Makefile', 'package.json']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_buftag_types = {
  \ 'go' : '--language-force=go --golang-types=ft'
  \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|vendor|_site|node_modules$',
  \ 'file': '\v\.(exe|so|dll|pyc|beam|class)$',
  \ }

" ack -> ag

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" sql - please don't complete

let g:omni_sql_no_default_maps = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Poor mans statusline

set statusline=\ %t       "tail of the filename
set statusline+=\%r       "read only flag
set statusline+=\%m       "modified flag
set statusline+=\ %y      "filetype
set statusline+=\ %{LinterStatus()}
set statusline+=%=\ row\ %l/%L\ -\ %c "right lines + line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS

" open help in new tab
cabbrev h tab help
" y$ -> Y Make Y behave like other capitals
map Y y$

" typo help
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev W w
cnoreabbrev Q q

" no Ex mode
nnoremap Q <nop>

" get rid of the bloody help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>

nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
nnoremap <leader>af :ALEFix<cr>

" germanizm
nnoremap <Leader>ä :tabnext<CR>
nnoremap <Leader>ö :tabprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM COMMANDS

command! Make silent make | cw 5 | redraw!
command! CD cd %:p:h
command! Open silent !open %:p:h
command! Todo silent Ack TODO\\|FIXME\\|CHANGED\\|FIX
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>
command! Vimrc :e ~/.vimrc
command! Date put=strftime('%Y-%m-%d - %H:%M')

" FUNCS

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=78
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO CMD / Filetype based modifications

" make
au FileType make setl noexpandtab

" faust
au BufRead,BufNewFile *.dsp set filetype=faust

" markdown
au BufRead,BufNewFile *.{md,markdown,txt} setf markdown | call s:setupWrapping()

" javascript
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
au FileType javascript nnoremap <F6>   :w<CR>:!node %:p<CR>

" golang
let g:go_fmt_command = "goimports"

augroup go
  au!
  au FileType go setl nolist
  au FileType go nmap <F6> <Plug>(go-run)
  au FileType go nmap <F12> <Plug>(go-test)
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
augroup END


" rust

let g:rustfmt_autosave = 1

" haskell

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
au FileType haskell map <buffer> <F6> :w<CR>:terminal stack runhaskell %:p<CR>


" c

" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q

au FileType c,cpp set nolist
au FileType c,cpp set makeprg=make\ -C\ build
au FileType c,cpp nnoremap <F5> :w<CR>:make<CR>
au FileType c,cpp set tabstop=4
au FileType c,cpp set shiftwidth=4
au BufRead,BufNewFile *.h set filetype=c

" python
let g:ultisnips_python_quoting_style = 'single'
let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 1
let g:jedi#goto_command = "gd"

au FileType python map <buffer> <F6> :w<CR>:!python %:p<CR>

" git

autocmd Filetype gitcommit setlocal spell textwidth=72
