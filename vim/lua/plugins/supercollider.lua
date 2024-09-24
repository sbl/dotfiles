return {
	{
		"davidgranstrom/scnvim",
		ft = "supercollider",
		config = function()
			local scnvim = require("scnvim")
			local map = scnvim.map
			local map_expr = scnvim.map_expr

			scnvim.setup({
				keymaps = {
					["<F5>"] = {
						map("editor.send_block", { "i", "n" }),
						map("editor.send_selection", "x"),
					},
					["<F6>"] = map("editor.send_line", { "i", "n" }),
					["<leader>sc"] = map("postwin.clear", { "n", "i" }),
					["<leader>sk"] = map("sclang.recompile", { "n", "i" }),
					["<leader>ss"] = map("sclang.start", { "n", "i" }),
					["<leader>sb"] = map_expr("Server.default.boot", { "n", "i" }),
					["<C-k>"] = map("signature.show", { "n", "i" }),
					["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
				},
			})
		end,
	},
}
