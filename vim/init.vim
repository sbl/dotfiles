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

" colors

Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim'

" IDE

Plug 'neovim/nvim-lspconfig'
Plug 'nathunsmitty/nvim-ale-diagnostic'
Plug 'nvim-lua/completion-nvim'
Plug 'dense-analysis/ale'

" interface

Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" language

Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'sersorrel/vim-lilypond'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'supercollider/scvim'

call plug#end()

filetype on
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

" reload config on buffer write
autocmd! BufWritePost $HOME/.config/nvim/init.vim source $HOME/.config/nvim/init.vim

set history=10000
set wildmode=list:longest,full
set autoread

let mapleader = ","
let g:mapleader = ","

set showcmd     "show incomplete cmds down the bottom
set smartcase   "be smart when searching
set nohlsearch
set ignorecase
set wildignore+=*/tmp/*,*/cache/*,*/dist/*,*.so,*.o,*.swp,*.zip,*.pyc

set nonumber
set foldcolumn=0
set foldmethod=syntax
set nofoldenable
set nowrap

" display hidden characters
set listchars=tab:▸\ ,nbsp:•,trail:…
set list

" wrapping and line length
set tw=78
set linebreak
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

" per directory config

set exrc
set secure

" colors

"set termguicolors
"colorscheme solarized8_flat
colorscheme nord

set mouse=a
set clipboard^=unnamed,unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Poor mans statusline

set statusline=\ %t       " tail of the filename
set statusline+=\%r       " read only flag
set statusline+=\%m       " modified flag
set statusline+=\ %y      " filetype

set statusline+=%=\ row\ %l/%L\ -\ %c " right lines + line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

source <sfile>:h/init/ale.vim
source <sfile>:h/init/lsp.vim
source <sfile>:h/init/completion.vim


" NERDTree

let g:NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore=1
nnoremap <Leader>d :NERDTreeToggle<CR>

" RAGTAG

let g:ragtag_global_maps = 1

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
" KEY MAPPINGS

" term
tnoremap <Esc> <C-\><C-n>

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

nnoremap <Leader>w :w<CR>
nnoremap <Leader>b :bd<CR>
nnoremap <leader>l :lopen<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM COMMANDS

command! CD cd %:p:h
command! Open silent !open '%:p:h'
command! Todo silent Ag "TODO|FIXME|CHANGED|FIX"
command! Vimrc :e ~/.config/nvim/init.vim
command! Fish :e ~/.config/fish/config.fish
command! Date put=strftime('%Y-%m-%d - %H:%M')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO CMD / Filetype based modifications
" also see ftplugin folder

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" make
au FileType make setl noexpandtab

" faust
au BufRead,BufNewFile *.{dsp,lib} set filetype=faust

" markdown
au BufRead,BufNewFile *.{md,markdown,txt} setf markdown
au Filetype markdown setlocal spell textwidth=72

" git
autocmd Filetype gitcommit setlocal spell textwidth=72
