"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
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
Plugin 'tpope/vim-fugitive'

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'benmills/vim-golang-alternate'
Plugin 'elixir-lang/vim-elixir'
Plugin 'sbl/scvim'
Plugin 'JuliaLang/julia-vim'
Plugin 'wting/rust.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

filetype plugin indent on

set history=500
set encoding=utf-8
set autoread

"allow backspacing over everything in insert mode
set backspace=indent,eol,start
let mapleader = ","
let g:mapleader = ","

set showcmd                 "show incomplete cmds down the bottom
set wildmenu                "enhanced command line completion
set wildmode=list:longest   "shell like file completion

set incsearch   "find the next match as we type the search
set smartcase   "be smart when searching
set ignorecase

" ignorance is bliss
set wildignore+=*/tmp/*,*/cache/*,*/dist/*,*.so,*.swp,*.zip

"set numberwidth=2
set nonumber
set foldcolumn=0
set ruler

set nowrap

" display hidden characters
set listchars=tab:▸\ ,nbsp:•,trail:…
set list

" comment formatting help
set tw=78
set formatoptions-=t
set formatoptions+=croql

set autoindent
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

" statusline

set laststatus=2

set statusline=\ %t       "tail of the filename
set statusline+=\%r       "read only flag
set statusline+=\%m       "modified flag
set statusline+=%h        "help
set statusline+=\ %y      "filetype
"set statusline+=\ %{fugitive#statusline()} "git status
set statusline+=%=\ row\ %l/%L\ -\ %c "right lines + line

set vb " disable error bell
set kp=:help    " I barely need a man output

syntax enable

" set cursor in iTerm2
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

colorscheme base16-flat

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

" RAGTAG

let g:ragtag_global_maps = 1

" NETRW
let g:netrw_banner       = 0
let g:netrw_keepdir      = 1
"let g:netrw_liststyle    = 3 " or 3
let g:netrw_sort_options = 'i'

" SUPERTAB
let g:SuperTabDefaultCompletionType = "context"

" CLANG
let g:clang_complete_auto = 0

" CTRLP
let g:ctrlp_root_markers = ['Makefile', 'package.json']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|deps|_build|vendor|node_modules|bower_components$',
  \ 'file': '\v\.(exe|so|dll|beam|class)$',
  \ }

" SCVIM

let g:sclangTerm = "open -a iTerm.app"
let g:sclangKillOnExit = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS

" open help in new tab
cabbrev h tab help

" get rid of the bloody help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" global save cmd
nnoremap <F5> :Make<CR>

nmap <Leader>t :TagbarToggle<CR>
nmap <leader>w :Update<CR>

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO CMD / Filetype based modifications

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=78
endfunction

au FileType make setl noexpandtab

au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.{handlebars,hbs} UltiSnipsAddFiletypes html.mustache
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
au BufRead,BufNewFile *.{handlebars,hbs} :UltiSnipsAddFiletypes html.mustache

autocmd Filetype gitcommit setlocal spell textwidth=72

" close preview automatically
au CursorMovedI * if pumvisible() == 0|pclose|endif
au InsertLeave * if pumvisible() == 0|pclose|endif
