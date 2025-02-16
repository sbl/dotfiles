return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	opts = {
		formatters_by_ft = {
			css = { "prettierd" },
			go = { "goimports", "gofmt" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			python = { "ruff_format", "ruff_organize_imports" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
		},

		format_on_save = {
			timeout_ms = 2000, -- djlint is slow
			lsp_fallback = true,
		},
	},

	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
