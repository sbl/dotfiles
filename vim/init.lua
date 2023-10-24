local HOME = os.getenv("HOME")
local opt = vim.opt

-- keep vim-pack initially
vim.cmd([[
filetype off

call plug#begin('~/.config/nvim/plugged')

" core

Plug 'andymass/vim-matchup'
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-sandwich'
Plug 'RRethy/nvim-treesitter-endwise'

" IDE

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvimtools/none-ls.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'

Plug 'simrat39/symbols-outline.nvim'
Plug 'folke/trouble.nvim'

Plug 'L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'

" interface

Plug 'nvim-lualine/lualine.nvim'
Plug 'shaunsingh/nord.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }

" language

Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()

filetype = on
filetype = plugin on
filetype = indent on
]])


----------------------------------------------------------------
-- GENERAL

-- reload config on buffer write

opt.history = 10000
opt.wildmode = "list:longest,full"
opt.autoread = true

vim.g.mapleader = ","

opt.showcmd = true   -- show incomplete cmds down the bottom
opt.smartcase = true --be smart when searching
opt.hlsearch = false
opt.ignorecase = true
opt.wildignore = { "*/tmp/*", "*/cache/*", "*.so", "*.o", "*.swp", "*.zip", "*.pyc", "*.d" }

opt.number = false
opt.signcolumn = "yes"
opt.foldcolumn = "0"
opt.foldmethod = "expr"
opt.foldenable = false
opt.wrap = false


-- display hidden characters
opt.listchars = { tab = "▸ ", nbsp = "•", trail = "…" }
opt.list = true

-- wrapping and line length
opt.tw = 78
opt.linebreak = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true


opt.backup = false
opt.swapfile = false
opt.writebackup = false

opt.hidden = true --allow me to switch unsaved buffers
opt.splitbelow = true
opt.splitright = true

opt.shortmess:append("c") -- Shut off completion messages
opt.vb = true             -- disable error bell
opt.kp = ":help"          -- I barely need a man output

-- per directory config

opt.exrc = true
opt.secure = true

-- netrw disable
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- colors

opt.termguicolors = true

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = false

vim.cmd("colorscheme nord")

opt.mouse = "a"
opt.clipboard = { "unnamed", "unnamedplus" }

-----------------------------------------------------------------
-- PLUGIN SUPPORT

require('mason').setup({
  ui = {
    check_outdated_packages_on_open = false,
  }
})
require('mason-lspconfig').setup({
  automatic_installation = {
    exclude = { "zls" },
  }
})

require("luasnip.loaders.from_snipmate").lazy_load()

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

-----------------------------------------------------------------
-- KEY MAPPINGS
-- https://github.com/nanotee/nvim-lua-guide#defining-mappings

-- typos
vim.cmd([[
cabbrev h tab help
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev W w
cnoreabbrev Q q
]])

-- y$ -> Y Make Y behave like other capitals
vim.keymap.set("", "Y", "y$")

-- Make j/k visual down and up instead of whole lines
vim.keymap.set("", "j", "gj")
vim.keymap.set("", "k", "gk")

-- no Ex mode
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })

vim.keymap.set({ "i", "n", "v" }, "<F1>", "<nop>")

vim.keymap.set("n", "<c-p>", require 'telescope.builtin'.find_files, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", ":SymbolsOutline<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>d", ":NvimTreeToggle<cr>", { silent = true, noremap = true })

-----------------------------------------------------------------
-- CUSTOM COMMANDS

vim.cmd([[
command! CD cd %:p:h
command! Open silent !open '%:p:h'
command! Todo silent rg "TODO|FIXME|CHANGED|FIX"
command! Vimrc :e ~/.config/nvim/init.lua
command! Fish :e ~/.config/fish/config.fish
command! Oldfiles :Telescope oldfiles
]])


-----------------------------------------------------------------
-- AUTO CMD / Filetype based modifications

local autocmd = vim.api.nvim_create_autocmd

vim.g.zig_fmt_autosave = 0

autocmd({ "BufWritePost" }, {
  pattern = HOME .. "/.config/nvim/init.lua",
  command = "source " .. HOME .. "/.config/nvim/init.lua"
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.{md,markdown,txt}",
  command = "setf markdown"
})
autocmd({ "BufRead", "BufNewFile" }, { pattern = ".prettierrc", command = "setf json" })


autocmd({ "BufRead", "BufNewFile" }, {
  group = "filetypedetect",
  pattern = "go.mod",
  command = "setf gomod"
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = "filetypedetect",
  pattern = "*.tmpl",
  command = "setf gohtmltmpl"
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = "filetypedetect",
  pattern = "*.tmpl",
  command = "setf gohtmltmpl"
})

local quickfix = vim.api.nvim_create_augroup('quickfix', { clear = true })
autocmd("FileType", {
  group = quickfix,
  pattern = "qf",
  command = "setlocal wrap"
})

autocmd("FileType", {
  pattern = "go",
  command = "setl nolist"
})

autocmd("FileType", {
  pattern = "make",
  command = "setl noexpandtab"
})

autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal textwidth=72 wrap"
})
