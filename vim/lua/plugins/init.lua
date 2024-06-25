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
}

-- -- keep vim-pack initially

-- Plug 'williamboman/mason-lspconfig.nvim'
-- Plug 'neovim/nvim-lspconfig'

-- Plug 'hrsh7th/nvim-cmp'
-- Plug 'hrsh7th/cmp-nvim-lsp'
-- Plug 'hrsh7th/cmp-buffer'
-- Plug 'hrsh7th/cmp-path'

-- Plug 'rafamadriz/friendly-snippets'
-- Plug 'L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'}
-- Plug 'saadparwaiz1/cmp_luasnip'

-- call plug#end()
-- ]])

-- require("mason-lspconfig").setup({
-- 	automatic_installation = {
-- 		exclude = { "zls" },
-- 	},
-- })
