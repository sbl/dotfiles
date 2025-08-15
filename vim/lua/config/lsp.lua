-- LSP setup and config

vim.lsp.enable({
	"clangd",
	-- "eslint",
	"gopls",
	"jsonls",
	"lua_ls",
	"pyright",
	"ruff",
	"ts_ls",
	"zls",
})

-- lsp mappings
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspMappings", {}),
	callback = function(event)
		local opts = { buffer = event.buf }
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- we largely leverage the default LSP mappings
		-- https://neovim.io/doc/user/lsp.html#:~:text=GLOBAL,-DEFAULTS

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		-- Diagnostic navigation
		vim.keymap.set("n", "<leader>ä", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)
		vim.keymap.set("n", "<leader>ö", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)

		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		end
	end,
})
