return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "FzfLua",
		keys = {
			{ "<c-p>", "<cmd>FzfLua files<CR>", { silent = true, noremap = true } },
		},
	},
}
