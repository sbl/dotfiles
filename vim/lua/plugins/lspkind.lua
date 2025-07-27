return {
	{
		-- This tiny plugin adds vscode-like pictograms to neovim built-in lsp:
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init()
		end,
	},
}
