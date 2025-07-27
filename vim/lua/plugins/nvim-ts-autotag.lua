return {
	-- Use treesitter to autoclose and autorename html tag
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
