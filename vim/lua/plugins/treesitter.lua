return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"css",
				"cmake",
				"cpp",
				"eex",
				"elixir",
				"fish",
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"heex",
				"html",
				"htmldjango",
				"javascript",
				"lua",
				"make",
				"objc",
				"python",
				"ron",
				"ruby",
				"rust",
				"scss",
				"supercollider",
				"svelte",
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
		},
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "RRethy/nvim-treesitter-endwise" },
			{ "windwp/nvim-ts-autotag" },
			{ "andymass/vim-matchup" },
		},
	},
}
