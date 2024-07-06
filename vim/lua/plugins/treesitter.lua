return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"cmake",
					"cpp",
					"eex",
					"elixir",
					"fish",
					"go",
					"gomod",
					"gosum",
					"heex",
					"html",
					"javascript",
					"lua",
					"objc",
					"python",
					"ruby",
					"rust",
					"swift",
					"typescript",
					"vim",
					"vimdoc",
					"zig",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
					disable = { "html", "javascript", "typescript" },
				},
				indent = {
					enable = true,
					disable = { "javascript", "typescript" },
				},
				endwise = {
					enable = true,
				},
				matchup = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
			})
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "RRethy/nvim-treesitter-endwise" },
			{ "windwp/nvim-ts-autotag" },
			{ "andymass/vim-matchup" },
		},
	},
}
