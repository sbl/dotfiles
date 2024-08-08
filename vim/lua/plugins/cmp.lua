return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
			"zbirenbaum/copilot-cmp",
		},
		event = "InsertEnter",
		init = function()
			vim.o.completeopt = "menuone,noselect"
		end,

		config = function()
			-- Setup nvim-cmp.
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			--- CMP config

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						symbol_map = { Copilot = "" },
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					}),
				},
				completion = {
					-- autocomplete = false,
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "copilot", group_index = 2 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
