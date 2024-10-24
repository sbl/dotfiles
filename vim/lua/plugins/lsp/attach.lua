local M = {}

-- use the attach callback to configure completion and key mappings
function M.on_attach_config(_, bufnr)
	local keymap_opts = { noremap = true, silent = true, buffer = bufnr }

	local function buf_set_keymap(...)
		vim.keymap.set(...)
	end

	-- "]d" and "[d" in Normal mode
	buf_set_keymap("n", "<leader>ö", vim.diagnostic.goto_prev, keymap_opts)
	buf_set_keymap("n", "<leader>ä", vim.diagnostic.goto_next, keymap_opts)

	buf_set_keymap("n", "gd", vim.lsp.buf.definition, keymap_opts)
	buf_set_keymap("n", "gD", vim.lsp.buf.declaration, keymap_opts)
	buf_set_keymap("n", "gi", ":Trouble lsp_implementations toggle focus=true<cr>", keymap_opts)
	buf_set_keymap("n", "gr", ":Trouble lsp_references toggle focus=true<cr>", keymap_opts)
	buf_set_keymap("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
	buf_set_keymap("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
	buf_set_keymap("i", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)

	buf_set_keymap("n", "<leader>a", vim.lsp.buf.code_action, keymap_opts)
	buf_set_keymap("n", "<F2>", vim.lsp.buf.rename, keymap_opts)
end

local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

M.handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- Add border to the diagnostic popup window
vim.diagnostic.config({
	virtual_text = {
		prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
	},
	float = { border = border },
})

return M
