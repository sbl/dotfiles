return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
		init = function(plugin) end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		opts = {
			ensure_installed = {
				"c",
				"cmake",
				"cpp",
				"elixir",
				"heex",
				"eex",
				"fish",
				"go",
				"gomod",
				"gosum",
				"html",
				"javascript",
				"lua",
				"python",
				"ruby",
				"rust",
				"templ",
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
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-ts-autotag",
		},
	},
}
