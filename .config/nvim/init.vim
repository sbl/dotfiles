"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

call plug#begin('~/.config/nvim/bundle')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'steelsojka/deoplete-flow'
Plug 'davidhalter/jedi-vim'

Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'flowtype/vim-flow'
"Plug 'elmcast/elm-vim'

call plug#end()

filetype on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

" reload when saving this
autocmd! BufWritePost init.vim source ~/.config/nvim/init.vim

set history=10000
set wildmode=list:longest,full

let mapleader = ","
let g:mapleader = ","

set showcmd     "show incomplete cmds down the bottom
set smartcase   "be smart when searching
set nohlsearch
set ignorecase
set wildignore+=*/tmp/*,*/cache/*,*/dist/*,*.so,*.swp,*.zip,*.pyc

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

set statusline=\ %t       "tail of the filename
set statusline+=\%r       "read only flag
set statusline+=\%m       "modified flag
set statusline+=\ %y      "filetype
set statusline+=%=\ row\ %l/%L\ -\ %c "right lines + line

set vb " disable error bell
set kp=:help    " I barely need a man output
"set clipboard+=unnamedplus

set background=dark
let base16colorspace=256
colorscheme base16-flat

" neovim

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  tnoremap <Esc> <C-\><C-n>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

" NERDTree

let NERDTreeIgnore=['\.pyc$']
let g:NERDTreeMinimalUI = 1

" RAGTAG

let g:ragtag_global_maps = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "context"

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" close preview automatically
au CursorMovedI * if pumvisible() == 0|pclose|endif
au InsertLeave * if pumvisible() == 0|pclose|endif

" CTRLP
let g:ctrlp_root_markers = ['Makefile', 'package.json']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_buftag_types = {
  \ 'go' : '--language-force=go --golang-types=ft'
  \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|venv|elm-stuff|vendor|node_modules$',
  \ 'file': '\v\.(exe|so|dll|pyc|beam|class)$',
  \ }

" neomake

let g:neomake_python_flake8_maker = {
  \ 'exe': $HOME . '/bin/flake8'
  \ }

let g:neomake_javascript_enabled_makers = ['flow']
let g:neomake_jsx_enabled_makers = ['flow']

autocmd! BufWritePost * Neomake

" ack -> ag

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" sql - please don't complete

let g:omni_sql_no_default_maps = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS

" open help in new tab
cabbrev h tab help

" no Ex mode
nnoremap Q <nop>

" get rid of the bloody help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>

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
command! Vimrc :e ~/.config/nvim/init.vim

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

" markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

" javascript
let g:flow#enable = 0
let g:flow#autoclose = 1
au FileType javascript nnoremap <F6>   :w<CR>:!node %:p<CR>
au FileType javascript nnoremap <F12>  :w<CR>:FlowMake<CR>

" golang
let g:go_fmt_command = "goimports"

augroup go
  au!
  au FileType go setl nolist
  au FileType go nmap <F6> <Plug>(go-run)
  au FileType go nmap <F12> <Plug>(go-test)
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
augroup END

" elm
"let g:polyglot_disabled = ['elm']
"let g:elm_format_autosave = 1
"let g:elm_make_show_warnings = 1
"let g:elm_setup_keybindings = 0

"autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 tabstop=4
"autocmd FileType elm setlocal keywordprg=:ElmShowDocs
"autocmd FileType elm nmap <F12> <Plug>(elm-make)

" python
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
let g:ultisnips_python_quoting_style = 'single'

" deoplete is used for completions
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "gd"

"autocmd BufWinEnter '__doc__' setlocal bufhidden=delete
au FileType python map <buffer> <F6> :w<CR>:!python %:p<CR>

command! Yapf silent 0,$!yapf

" git

autocmd Filetype gitcommit setlocal spell textwidth=72
