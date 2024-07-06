return {
	{
		"mfussenegger/nvim-lint",
		event = "InsertEnter",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				-- already using lsp
				-- python = { "ruff" },
				javascript = { "eslint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				-- group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
