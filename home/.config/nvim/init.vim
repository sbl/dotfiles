"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'neomake/neomake'

" Language Support
Plugin 'sheerun/vim-polyglot'
Plugin 'flowtype/vim-flow'
Plugin 'fatih/vim-go'
Plugin 'davidhalter/jedi-vim'
"Plugin 'sbl/scvim'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

filetype plugin indent on

" some of the nvim defaults, for consistency
set autoindent
set autoread
set backspace=indent,eol,start
set display=lastline
set encoding=utf-8
set history=10000
set nocompatible
set smarttab
set wildmenu
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
set ruler
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

set laststatus=2
set statusline=\ %t       "tail of the filename
set statusline+=\%r       "read only flag
set statusline+=\%m       "modified flag
set statusline+=\ %y      "filetype
set statusline+=%=\ row\ %l/%L\ -\ %c "right lines + line

set vb " disable error bell
set kp=:help    " I barely need a man output

syntax enable

set background=dark
let base16colorspace=256
colorscheme base16-flat

" neovim

if has("nvim")
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  tnoremap <Esc> <C-\><C-n>
endif

" python support
"
let g:python_host_prog = '/Users/stephen/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/stephen/.pyenv/versions/neovim3/bin/python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

" NERDTree

let NERDTreeIgnore=['\.pyc$']

" RAGTAG

let g:ragtag_global_maps = 1

" SUPERTAB
let g:SuperTabDefaultCompletionType = "context"

" CTRLP
let g:ctrlp_root_markers = ['Makefile', 'package.json']
let g:ctrlp_open_new_file = 'r'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|venv|vendor|node_modules$',
  \ 'file': '\v\.(exe|so|dll|pyc|beam|class)$',
  \ }

" neomake

let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
autocmd! BufWritePost * Neomake

" SCVIM

let g:sclangTerm = "open -a iTerm.app"
let g:sclangKillOnExit = 0

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

" global make cmd
nnoremap <F5> :Neomake!<CR>
nnoremap <F12> :Neomake %<CR>

nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>d :NERDTreeToggle<CR>

" germanizm
nmap <Leader>ä :tabnext<CR>
nmap <Leader>ö :tabprevious<CR>

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

" close preview automatically
au CursorMovedI * if pumvisible() == 0|pclose|endif
au InsertLeave * if pumvisible() == 0|pclose|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO CMD / Filetype based modifications

" make
au FileType make setl noexpandtab

" markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

" javascript
au FileType javascript setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m,
au FileType javascript setlocal makeprg=eslint\ -f\ compact\ .

let g:jsx_ext_required = 0
au FileType javascript nnoremap <F6>   :w<CR>:!node %:p<CR>
au FileType javascript nnoremap <F12>  :w<CR>:!npm run test<CR>

" golang
let g:go_fmt_command = "goimports"

augroup go
  au!
  au FileType go setl nolist
  au FileType go nmap gd <Plug>(go-def)
  au FileType go nmap K <Plug>(go-doc)
  au FileType go nmap <F6> <Plug>(go-run)
  au FileType go nmap <F12> <Plug>(go-test)
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
augroup END

au FileType setl noet ts=4 sw=4 sts=4

" python
let g:python_host_prog = '/usr/local/bin/python'
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "gd"
au FileType python map <buffer> <F6> :w<CR>:!python %:p<CR>

" haskell

let g:haskell_tabular = 1
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
au FileType haskell setlocal omnifunc=necoghc#omnifunc
au FileType haskell setlocal formatoptions+=croql
au FileType haskell nnoremap <F5>   :w<CR>:!stack test<CR>
au FileType haskell nnoremap <F6>   :w<CR>:!stack runghc %:p<CR>
au FileType haskell nnoremap <F12>  :w<CR>:GhcModCheckAndLintAsync<CR>
au FileType haskell nnoremap <Leader>ht  :GhcModInfoPreview<CR>
au FileType haskell nnoremap <Leader>hi  :GhcModTypeInsert<CR>
au FileType haskell setlocal nofoldenable
set tags=tags;/,codex.tags;/

autocmd Filetype gitcommit setlocal spell textwidth=72
