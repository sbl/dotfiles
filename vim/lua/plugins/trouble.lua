return {
	"folke/trouble.nvim",
	opts = {
		auto_close = true,
		mode = "document_diagnostics",
	}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",

	keys = {
		{ "<leader>t", "<cmd>:Trouble symbols focus<cr>", { silent = true, noremap = true } },
	},
}
