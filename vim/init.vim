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
Plug 'ayu-theme/ayu-vim'

" IDE

"Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-dispatch'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'

" interface

Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" language

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'dag/vim-fish'
Plug 'octol/vim-cpp-enhanced-highlight'

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
set wildignore+=*/tmp/*,*/cache/*,*/dist/*,*.so,*.swp,*.zip,*.pyc

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

set termguicolors
let ayucolor="light"
colorscheme ayu

set mouse=a
set clipboard^=unnamed,unnamedplus

" switch curson in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

" ALE
source $HOME/.config/nvim/ale.vim

" NERDTree

let g:NERDTreeMinimalUI = 1
nnoremap <Leader>d :NERDTreeToggle<CR>

" RAGTAG

let g:ragtag_global_maps = 1

" COMPLETION

let g:omni_sql_no_default_maps = 1

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

" netrw
let g:netrw_silent=1

" respect gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nnoremap <c-p> :FZF<CR>
nnoremap <Leader>t :BTags<CR>

" dispatch
let g:dispatch_no_maps = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Poor mans statusline

set statusline=\ %t       " tail of the filename
set statusline+=\%r       " read only flag
set statusline+=\%m       " modified flag
set statusline+=\ %y      " filetype

"set statusline+=\ %{AleStatus()} " ale
set statusline+=%=\ row\ %l/%L\ -\ %c " right lines + line

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

nnoremap <Leader>w :w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM COMMANDS

command! CD cd %:p:h
command! Open silent !open '%:p:h'
command! Todo silent Ag "TODO|FIXME|CHANGED|FIX"
command! Vimrc :e ~/.config/nvim/init.vim
command! Fish :e ~/.config/fish/config.fish
command! Date put=strftime('%Y-%m-%d - %H:%M')

" FUNCS

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=78
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO CMD / Filetype based modifications

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" make
au FileType make setl noexpandtab

" faust
au BufRead,BufNewFile *.{dsp,lib} set filetype=faust

" markdown
au BufRead,BufNewFile *.{md,markdown,txt} setf markdown | call s:setupWrapping()

" python
au FileType python set wrap!
au FileType python set nowrap
au FileType python set tw=0

" c
au FileType c,cpp set nolist
au FileType c,cpp set tabstop=2
au FileType c,cpp set shiftwidth=2

" go
au FileType go setl nolist
au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')

" git
autocmd Filetype gitcommit setlocal spell textwidth=72

" supercollider

let g:scnvim_scdoc = 1
let g:scnvim_no_mappings = 1
au FileType supercollider nmap <buffer> <leader>p <Plug>(scnvim-postwindow-clear)
au FileType supercollider nmap <buffer> <leader>l <Plug>(scnvim-recompile)
au FileType supercollider nmap <buffer> <F5> <Plug>(scnvim-send-block)
au FileType supercollider nmap <buffer> <F6> <Plug>(scnvim-send-line)
au FileType supercollider nmap <buffer> <F12> <Plug>(scnvim-hard-stop)
au FileType supercollider set tabstop=2
au FileType supercollider set shiftwidth=2
