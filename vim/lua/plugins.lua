require("plugins.lsp")
require("plugins.completion")
require("plugins.treesitter")
require("plugins.conform")
require("plugins.lint")
require("plugins.luasnip")

require("mason").setup({
	ui = {
		check_outdated_packages_on_open = false,
	},
})
require("mason-lspconfig").setup({
	automatic_installation = {
		exclude = { "zls" },
	},
})

require("nvim-ts-autotag").setup({})

require("trouble").setup({
	auto_close = true,
	mode = "document_diagnostics",
})

require("nvim-tree").setup({
	git = {
		enable = true,
	},
	filters = {
		custom = { ".git" },
	},
})
