return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				git = {
					enable = true,
				},
				filters = {
					custom = { ".git" },
				},
			})
		end,
		keys = {
			{ "<leader>d", ":NvimTreeToggle<cr>", { silent = true, noremap = true } },
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		keys = {
			{ "<c-p>", require("telescope.builtin").find_files, { silent = true, noremap = true } },
		},
	},
}
