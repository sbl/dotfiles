return {
	{
		"nordtheme/vim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nord")
		end,
	},
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
					custom = { "^\\.git" },
				},
			})
		end,
		keys = {
			{ "<leader>d", ":NvimTreeToggle<cr>", { silent = true, noremap = true } },
		},
	},

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		opts = function(_, opts) end,

		cmd = "FzfLua",
		keys = {
			{ "<c-p>", "<cmd>FzfLua files<CR>", { silent = true, noremap = true } },
		},
	},
}
