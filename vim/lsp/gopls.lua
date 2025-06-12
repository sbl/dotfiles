return {
	cmd = { "gopls" },
	root_markers = { "go.mod" },
	filetypes = { "go", "gomod", "gosum", "gotmpl" },

	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

