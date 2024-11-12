-----------------------------------------------------------------
-- CUSTOM COMMANDS

vim.cmd([[
command! CD cd %:p:h
command! Open silent !open '%:p:h'
command! Vimrc :Telescope find_files search_dirs={"$HOME/.config/nvim"}
command! Fish :e ~/.config/fish/config.fish
command! Oldfiles :Telescope oldfiles
command! Buffers :Telescope buffers
]])

-----------------------------------------------------------------
-- AUTO CMD / Filetype based modifications

local HOME = os.getenv("HOME")
local autocmd = vim.api.nvim_create_autocmd

-- reload on save
autocmd({ "BufWritePost" }, {
	pattern = HOME .. "/.config/nvim/init.lua",
	command = "source " .. HOME .. "/.config/nvim/init.lua",
})

autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.swi", command = "setlocal ft=ocaml" })
autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.{md,markdown}", command = "setlocal ft=markdown wrap" })
autocmd({ "BufRead", "BufNewFile" }, { pattern = "go.mod", command = "set ft=gomod" })

local quickfix = vim.api.nvim_create_augroup("quickfix", { clear = true })
autocmd("FileType", { group = quickfix, pattern = "qf", command = "setlocal wrap" })
autocmd("FileType", { pattern = "make", command = "setl noexpandtab" })
