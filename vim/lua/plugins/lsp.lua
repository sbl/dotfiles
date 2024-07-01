return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = {
					exclude = { "zls" },
				},
			})
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
				filetypes = { "html" },
			})

			nvim_lsp.gopls.setup({
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						templateExtensions = { "tmpl" },
					},
				},
				on_attach = on_attach_config,
				capabilities = cmp_capabilities,
				handlers = handlers,
			})

			nvim_lsp.jsonls.setup(standardSetup)
			nvim_lsp.pyright.setup(standardSetup)

			-- nvim_lsp.ruby_lsp.setup(standardSetup)
			nvim_lsp.ruff_lsp.setup(standardSetup)
			nvim_lsp.sourcekit.setup(standardSetup)
			nvim_lsp.tsserver.setup(standardSetup)

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
