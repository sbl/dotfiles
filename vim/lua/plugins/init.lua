return {
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.g.nord_italic = false
			vim.g.nord_borders = true
		end,
		config = function()
			-- require("nord").set()
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				check_outdated_packages_on_open = false,
			},
		},
	},
	{ "machakann/vim-sandwich", event = "VeryLazy" },
}
