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

-- use ctrl-c as esc
vim.keymap.set({ "i", "t" }, "<C-c>", "<Esc>", { noremap = true, silent = true })
