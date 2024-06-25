return {
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local ls = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load({
				exclude = { "html" },
			})

			-- custom snippets in snipmate format
			require("luasnip.loaders.from_snipmate").lazy_load()

			-- keypmaps

			vim.keymap.set({ "i" }, "<C-K>", function()
				ls.expand()
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				ls.jump(1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-J>", function()
				ls.jump(-1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-E>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
		end,
	},
}
