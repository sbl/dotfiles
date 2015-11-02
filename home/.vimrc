"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'

Plugin 'vim-ruby/vim-ruby'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'benmills/vim-golang-alternate'
Plugin 'sbl/scvim'
Plugin 'Shougo/vimproc'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'nbouscal/vim-stylish-haskell'

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
set wildignore+=*/tmp/*,*/cache/*,*/dist/*,*.so,*.swp,*.zip

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
colorscheme base16-flat

" neovim

if has("nvim")
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  tnoremap <Esc> <C-\><C-n>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

" RAGTAG

let g:ragtag_global_maps = 1

" SUPERTAB
let g:SuperTabDefaultCompletionType = "context"

" CTRLP
let g:ctrlp_root_markers = ['Makefile', 'package.json']
let g:ctrlp_open_new_file = 'r'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|deps|_build|build|target|vendor|node_modules|bower_components$',
  \ 'file': '\v\.(exe|so|dll|beam|class)$',
  \ }

" SCVIM

let g:sclangTerm = "open -a iTerm.app"
let g:sclangKillOnExit = 0

" ack -> ag

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" sql - please don't complete

let g:omni_sql_no_default_maps = 1

" jedi

let g:jedi#popup_on_dot = 0

let g:jsx_ext_required = 0

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
nnoremap <F5> :Make<CR>

nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>d :NERDTreeToggle<CR>

" germanizm
nmap <Leader>ä :tabnext<CR>
nmap <Leader>ö :tabprevious<CR>

" tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM COMMANDS

command! Make silent make | cw 5 | redraw!
command! CD cd %:p:h
command! Open silent !open %:p:h 
command! Todo silent Ack TODO\\|FIXME\\|CHANGED\\|FIX
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>
command! -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
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

" golang
let g:go_fmt_command = "goimports"

au FileType go setl nolist
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap K <Plug>(go-doc)
au FileType go nmap <F5> <Plug>(go-build)
au FileType go nmap <F6> <Plug>(go-run)
au FileType go nmap <F12> <Plug>(go-test)
au FileType setl noet ts=4 sw=4 sts=4

" haskell

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
