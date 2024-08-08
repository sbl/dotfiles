return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"zbirenbaum/copilot-cmp",
		},
		event = "InsertEnter",
		init = function()
			vim.o.completeopt = "menuone,noselect"
		end,

		config = function()
			-- Setup nvim-cmp.
			local cmp = require("cmp")

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
					-- { name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
