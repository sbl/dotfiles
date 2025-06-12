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

-- alternate file
vim.keymap.set("n", "<leader><leader>", "<C-^>")

-- lsp mappings
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspMappings", {}),
	callback = function(event)
		local opts = { buffer = event.buf }

		-- Diagnostic navigation
		vim.keymap.set("n", "<leader>ö", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>ä", vim.diagnostic.goto_next, opts)

		-- LSP navigation
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", ":Trouble lsp_implementations toggle focus=true<cr>", opts)
		vim.keymap.set("n", "gr", ":Trouble lsp_references toggle focus=true<cr>", opts)
		vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, opts)

		-- Signature help
		vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, opts)

		-- Code actions and refactoring
		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
	end,
})
