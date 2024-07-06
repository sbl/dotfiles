return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			aliases = {
				["heex"] = "html",
			},
		})
	end,
}
