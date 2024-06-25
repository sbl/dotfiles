return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	opts = {
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
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
