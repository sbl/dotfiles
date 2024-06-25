-----------------------------------------------------------------
-- CUSTOM COMMANDS

vim.cmd([[
command! CD cd %:p:h
command! Open silent !open '%:p:h'
command! Todo silent rg "TODO|FIXME|CHANGED|FIX"
command! Vimrc :e ~/.config/nvim/lua
command! Fish :e ~/.config/fish/config.fish
command! Oldfiles :Telescope oldfiles
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

autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.{md,markdown}", command = "set ft=markdown" })
autocmd({ "BufRead", "BufNewFile" }, { pattern = "go.mod", command = "set ft=gomod" })

local quickfix = vim.api.nvim_create_augroup("quickfix", { clear = true })
autocmd("FileType", { group = quickfix, pattern = "qf", command = "setlocal wrap" })
autocmd("FileType", { pattern = "make", command = "setl noexpandtab" })
