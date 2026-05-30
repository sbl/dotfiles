local opt = vim.opt

vim.g.mapleader = ","

opt.history = 10000
opt.wildmode = "list:longest,full"
-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

opt.showcmd = true -- show incomplete cmds down the bottom
opt.smartcase = true --be smart when searching
opt.hlsearch = false
opt.ignorecase = true
opt.wildignore = { "*/tmp/*", "*/cache/*", "*.so", "*.o", "*.swp", "*.zip", "*.pyc", "*.d" }

opt.conceallevel = 2

opt.number = true
opt.signcolumn = "yes"
opt.foldcolumn = "0"
opt.foldmethod = "expr"
opt.foldenable = false
opt.wrap = false

-- display hidden characters
opt.listchars = { tab = "▸ ", nbsp = "•", trail = "…" }
opt.list = false

-- wrapping and line length
-- opt.textwidth = 78
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
opt.vb = true -- disable error bell
opt.kp = ":help" -- I barely need a man output

-- per directory config

opt.exrc = true
opt.secure = true

-- mousing
opt.mouse = "a"
opt.clipboard = { "unnamed", "unnamedplus" }

-- completion
opt.completeopt = { "fuzzy", "menu", "popup", "noselect" }

-- UI

opt.background = "light"
vim.cmd.colorscheme("default")

opt.statusline = "%{expand('%:.')}"
	.. "%r%m %y" -- read, mod, type
	.. "%= row %l/%L - %c " -- right line

opt.winborder = "single" -- single line border around windows

-- grep
opt.grepprg = "rg --vimgrep --no-heading"
