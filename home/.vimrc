"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-endwise'
Bundle 'chriskempson/base16-vim'
Bundle 'SirVer/ultisnips'
Bundle 'ervandew/supertab'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'sbl/vim-rspec'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mustache/vim-mode'
Bundle 'elzr/vim-json'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jnwhiteh/vim-golang'
Bundle 'dgryski/vim-godef'
Bundle 'Blackrush/vim-gocode'
Bundle 'derekwyatt/vim-scala'
Bundle 'elixir-lang/vim-elixir'
Bundle 'sbl/scvim'

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
set wildignore+=*/tmp/*,*/cache/*,*.so,*.swp,*.zip

"set numberwidth=2
set nonumber
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
colorscheme base16-ocean

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

" TAGBAR

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort      = 0

" RAGTAG

let g:ragtag_global_maps = 1

" ULTISNIPS

" jump through snippets with tab
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["snippets"]

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
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|bower_components$',
  \ 'file': '\v\.(exe|so|dll|beam|class)$',
  \ }

" SCVIM

let g:sclangTerm = "open -a iTerm.app"
let g:sclangKillOnExit = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS

" get rid of the bloody help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" global save cmd
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
" re-map iterm cmd-s to point to f2: 0x1b 0x4f 0x51
nnoremap <F2> :Update<CR>
nnoremap <F5> :make!<CR>

" germanizm
nmap <Leader>ä :tabnext<CR>
nmap <Leader>ö :tabprevious<CR>

map <leader>t :TagbarToggle<CR>

" tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM COMMANDS

command! CD cd %:p:h
command! Open silent !open %:p:h 
command! Todo silent Ack TODO\\|FIXME\\|CHANGED\\|FIX
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO CMD / Filetype based modifications

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=78
endfunction

au FileType make set noexpandtab

au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.{handlebars,hbs} call UltiSnipsAddFiletypes('html.mustache')
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

au BufRead,BufNewFile *.{handlebars,hbs} :UltiSnipsAddFiletypes html.mustache

" close preview automatically
au CursorMovedI * if pumvisible() == 0|pclose|endif
au InsertLeave * if pumvisible() == 0|pclose|endif
