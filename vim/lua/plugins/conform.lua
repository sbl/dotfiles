require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettierd" },
		-- Conform will run multiple formatters sequentially
		go = { "goimports", "gofmt" },
		html = { "prettierd" },
		python = { "ruff_organize_imports" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "prettierd" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
