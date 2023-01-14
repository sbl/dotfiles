""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

call plug#begin('~/.config/nvim/plugged')

" core

Plug 'andymass/vim-matchup'
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-sandwich'
Plug 'RRethy/nvim-treesitter-endwise'

" IDE

Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'

Plug 'simrat39/symbols-outline.nvim'
Plug 'folke/trouble.nvim'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" interface

Plug 'lifepillar/vim-solarized8'
Plug 'shaunsingh/nord.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" languages

Plug 'simrat39/rust-tools.nvim'

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
set wildignore+=*/tmp/*,*/cache/*,*.so,*.o,*.swp,*.zip,*.pyc,*.d

set nonumber
set signcolumn=yes
set foldcolumn=0
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
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

" netrw disable
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1


" colors

set termguicolors

let g:nord_contrast = v:true
let g:nord_borders = v:true
let g:nord_disable_background = v:true
let g:nord_italic = v:false

colorscheme nord

set mouse=a
set clipboard^=unnamed,unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Poor mans statusline

set statusline=\ \ %t     " tail of the filename
set statusline+=\%r       " read only flag
set statusline+=\%m       " modified flag
set statusline+=\ %y      " filetype
set statusline+=%=\ row\ %l/%L\ -\ %c " right lines + line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SUPPORT

lua << EOF
  require('mason').setup {
    ui = {
      check_outdated_packages_on_open = false,
    }
  }
  require('mason-lspconfig').setup { automatic_installation = true }

  require('symbols-outline').setup()
  require('lsp')
  require('nulls')
  require('completion')
  require('treesitter')
  require("trouble").setup { mode = "document_diagnostics" }
  require('nvim-tree').setup({
    git = {
      enable = true,
    },
  })
EOF

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

nnoremap <c-p> :Telescope find_files<CR>
nnoremap <Leader>t :SymbolsOutline<CR>
nnoremap <Leader>d :NvimTreeToggle<CR>

let g:user_emmet_leader_key='<C-X>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM COMMANDS

command! CD cd %:p:h
command! Open silent !open '%:p:h'
command! Todo silent rg "TODO|FIXME|CHANGED|FIX"
command! Vimrc :e ~/.config/nvim/init.vim
command! Fish :e ~/.config/fish/config.fish
command! Oldfiles :Telescope oldfiles

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO CMD / Filetype based modifications
" also see ftplugin folder

au BufRead,BufNewFile *.{md,markdown,txt} setf markdown
au BufRead,BufNewFile .prettierrc setf json
au BufRead,BufNewFile go.mod set ft=gomod

augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

au FileType go setl nolist

au FileType make setl noexpandtab
au Filetype markdown setlocal textwidth=72 wrap
au Filetype gitcommit setlocal spell textwidth=72
