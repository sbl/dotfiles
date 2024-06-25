return {
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		config = function()
			vim.g.nord_italic = false
			vim.g.nord_borders = true
			require("nord").set()
		end,
	},

	{
		"williamboman/mason.nvim",
		lazy = "VeryLazy",
		opts = {
			ui = {
				check_outdated_packages_on_open = false,
			},
		},
	},
	{ "machakann/vim-sandwich", event = "VeryLazy" },
}
