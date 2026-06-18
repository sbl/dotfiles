return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "FzfLua",
		keys = {
			{
				"<c-p>",
				function()
					require("fzf-lua").files({
						cmd = "fd --type f --follow --no-hidden -X ls -t",
					})
				end,
				{ silent = true, noremap = true },
			},
		},
	},
}
