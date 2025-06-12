return {
	cmd = { "pyright-langserver", "--stdio" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	filetypes = { "python" },

	settings = {
		pyright = {
			-- ruff
			disableOrganizeImports = true,
			disableTaggedHints = true,
		},
		python = {
			analysis = {
				diagnosticSeverityOverrides = {
					-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
					reportUndefinedVariable = "none",
				},
			},
		},
	},
}
