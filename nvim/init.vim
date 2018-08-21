"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

call plug#begin('~/.config/nvim/plugged')

" core

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'lifepillar/vim-solarized8'

" IDE

Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-peekaboo'
Plug 'ajh17/VimCompletesMe'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" interface

Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" language

Plug 'sbl/scvim'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'reasonml-editor/vim-reason-plus'

call plug#end()

filetype on
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

" reload when saving this
autocmd! BufWritePost init.vim source ~/.config/nvim/init.vim

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

" colors

let g:solarized_statusline="normal"
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set termguicolors
set background=dark
colorscheme solarized8_flat

set mouse=a
set clipboard=unnamed

" make thin splits
hi VertSplit guibg=bg ctermbg=bg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

" python support

let g:loaded_python_provider = 1
let g:python3_host_prog = '/usr/local/miniconda3/bin/python'

" language client

" - npm install -g ocaml-language-server; opam install ocp-indent merlin
" - pip install pyls

let g:LanguageClient_serverCommands = {
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'reason': ['reason-language-server.exe'],
    \ 'python': ['pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>f :call LanguageClient#textDocument_formatting()<CR>

" NERDTree

let NERDTreeIgnore=['\.pyc$']
let g:NERDTreeMinimalUI = 1

nnoremap <Leader>d :NERDTreeToggle<CR>

" RAGTAG

let g:ragtag_global_maps = 1

" COMPLETION

let g:omni_sql_no_default_maps = 1

" close preview window
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" fzf

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <c-p> :FZF<CR>
nnoremap <Leader>t :BTags<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Poor mans statusline

set statusline=\ %t       "tail of the filename
set statusline+=\%r       "read only flag
set statusline+=\%m       "modified flag
set statusline+=\ %y      "filetype
"set statusline+=\ %=\%{LinterStatus()}
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

" germanizm
nnoremap <Leader>ä :cn<CR>
nnoremap <Leader>ö :cp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM COMMANDS

command! Make silent make | cw 5 | redraw!
command! CD cd %:p:h
command! Open silent !open %:p:h
command! Todo silent Ag TODO\\|FIXME\\|CHANGED\\|FIX
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>
command! Vimrc :e ~/.config/nvim/init.vim
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

" c
au FileType c,cpp set nolist
au FileType c,cpp set makeprg=make\ -C\ build
au FileType c,cpp nnoremap <F5> :w<CR>:make<CR>
au FileType c,cpp set tabstop=4
au FileType c,cpp set shiftwidth=4
au BufRead,BufNewFile *.h set filetype=c

" python
au FileType python map <buffer> <F6> :w<CR>:!python %:p<CR>
let g:ultisnips_python_quoting_style = 'single'

" git
autocmd Filetype gitcommit setlocal spell textwidth=72
