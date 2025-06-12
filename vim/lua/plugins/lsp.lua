return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason-lspconfig").setup()
			local nvim_lsp = require("lspconfig")
			local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lsp_attach = require("plugins.lsp.attach")
			local on_attach_config = lsp_attach.on_attach_config
			local handlers = lsp_attach.handlers

			-- diagnostic config

			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					virtual_text = false,
					signs = true,
					update_in_insert = true,
				})

			-- register and configure all servers

			local standardSetup = {
				on_attach = on_attach_config,
				capabilities = cmp_capabilities,
				handlers = handlers,
			}

			nvim_lsp.clangd.setup(standardSetup)
			nvim_lsp.eslint.setup(standardSetup)
			nvim_lsp.html.setup({
				on_attach = on_attach_config,
				capabilities = cmp_capabilities,
				handlers = handlers,
				filetypes = { "html", "htmldjango" },
			})

			nvim_lsp.gopls.setup(vim.tbl_extend("force", standardSetup, {
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			}))

			nvim_lsp.jsonls.setup(standardSetup)

			-- python

			nvim_lsp.pyright.setup({
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
			})
			nvim_lsp.ruff.setup(standardSetup)

			-- nvim_lsp.svelte.setup(standardSetup)
			nvim_lsp.ts_ls.setup(standardSetup)
			nvim_lsp.tailwindcss.setup(standardSetup)

			nvim_lsp.zls.setup(standardSetup)

			-- lua

			local lua_globals = { "vim" }
			require("lspconfig").lua_ls.setup({
				on_attach = on_attach_config,
				capabilities = cmp_capabilities,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = lua_globals,
							disable = { "missing-fields" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})
		end,
	},
}
