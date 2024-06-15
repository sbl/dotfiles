-- nvim-lsp config
local nvim_lsp = require("lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- use the attach callback to configure completion and key mappings

local function on_attach_config(_, bufnr)
  local keymap_opts = { noremap = true, silent = true, buffer = bufnr }

  local function buf_set_keymap(...)
    vim.keymap.set(...)
  end

  -- "]d" and "[d" in Normal mode
  buf_set_keymap("n", "<leader>ö", vim.diagnostic.goto_prev, keymap_opts)
  buf_set_keymap("n", "<leader>ä", vim.diagnostic.goto_next, keymap_opts)

  buf_set_keymap("n", "gd", vim.lsp.buf.definition, keymap_opts)
  buf_set_keymap("n", "gD", vim.lsp.buf.declaration, keymap_opts)
  buf_set_keymap("n", "gi", vim.lsp.buf.implementation, keymap_opts)
  buf_set_keymap("n", "gr", vim.lsp.buf.references, keymap_opts)
  buf_set_keymap("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
  buf_set_keymap("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
  buf_set_keymap("i", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)

  buf_set_keymap("n", "<leader>a", vim.lsp.buf.code_action, keymap_opts)
  buf_set_keymap("n", "<F2>", vim.lsp.buf.rename, keymap_opts)
end

-- diagnostic config

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = false,
  signs = true,
  update_in_insert = true,
})

-- register and configure all servers

local standardSetup = {
  on_attach = on_attach_config,
  capabilities = cmp_capabilities,
}

nvim_lsp.clangd.setup(standardSetup)
nvim_lsp.eslint.setup(standardSetup)
nvim_lsp.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      experimentalTemplateSupport = true,
      templateExtensions = { "tmpl", "gohtml" },
    },
  },
  on_attach = on_attach_config,
  capabilities = cmp_capabilities
})
-- nvim_lsp.html.setup(standardSetup)
nvim_lsp.jsonls.setup(standardSetup)
nvim_lsp.pyright.setup(standardSetup)

nvim_lsp.ruby_lsp.setup(standardSetup)
nvim_lsp.ruff_lsp.setup(standardSetup)
--nvim_lsp.tailwindcss.setup(standardSetup)
nvim_lsp.tsserver.setup(standardSetup)
--nvim_lsp.zls.setup(standardSetup)

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
