return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {
		auto_close = true,
		mode = "document_diagnostics",
	}, -- for default options, refer to the configuration section for custom setup.
	keys = {
		{ "<leader>t", "<cmd>Trouble symbols toggle focus=true<cr>", { silent = true, noremap = true } },
	},
}
