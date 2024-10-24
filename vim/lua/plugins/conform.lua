return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	opts = {
		formatters_by_ft = {
			css = { "prettierd" },
			html = { "prettierd" },
			gohtmltmpl = { "prettierd" },
			go = { "goimports", "gofmt" },
			javascript = { "prettierd" },
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
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
