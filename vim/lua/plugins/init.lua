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
		opts = {
			ui = {
				check_outdated_packages_on_open = false,
			},
		},
	},
	{ "andymass/vim-matchup", event = "VeryLazy" },
	{ "machakann/vim-sandwich", event = "VeryLazy" },
}


-- Plug 'rafamadriz/friendly-snippets'
-- Plug 'L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'}
-- Plug 'saadparwaiz1/cmp_luasnip'