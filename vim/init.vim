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

Plug 'editorconfig/editorconfig-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" interface

Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

" languages

Plug 'cespare/vim-toml'
Plug 'dag/vim-fish'
Plug 'gmoe/vim-soul'
Plug 'fatih/vim-go'
Plug 'elixir-editors/vim-elixir'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'ziglang/zig.vim'
Plug 'gmoe/vim-soul'
Plug 'fatih/vim-go'
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}


call plug#end()

filetype on
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

let g:python3_host_prog = "$HOME/.virtualenvs/neovim/bin/python"

" reload config on buffer write
autocmd! BufWritePost $HOME/.config/nvim/init.vim source $HOME/.config/nvim/init.vim

set history=10000
set wildmode=list:longest,full
set autoread

let g:mapleader = ","

set showcmd     "show incomplete cmds down the bottom
set smartcase   "be smart when searching
set nohlsearch
set ignorecase
set wildignore+=*/tmp/*,*/cache/*,*/_build/dist/*,*.so,*.o,*.swp,*.zip,*.pyc,*.d

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

lua require('lsp')
lua require('completion')
"lua require('treesitter')


" NERDTree

let g:NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore=1
nnoremap <Leader>d :NERDTreeToggle<CR>

" gitgutter

let g:gitgutter_enabled = 0

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

" prettier

let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat_config_present = 1


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
command! Todo silent rg "TODO|FIXME|CHANGED|FIX"
command! Vimrc :e ~/.config/nvim/init.vim
command! Fish :e ~/.config/fish/config.fish
command! Date put=strftime('%Y-%m-%d - %H:%M')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO CMD / Filetype based modifications
" also see ftplugin folder

au BufRead,BufNewFile *.{dsp,lib} set filetype=faust
au BufRead,BufNewFile *.{md,markdown,txt} setf markdown
au BufRead,BufNewFile CMakeLists.txt setf cmake
au BufRead,BufNewFile .prettierrc setf json

augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

au FileType make setl noexpandtab
au Filetype markdown setlocal textwidth=72 wrap
au Filetype gitcommit setlocal spell textwidth=72
