-- nvim-lsp config
local nvim_lsp = require("lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- use the attach callback to configure completion and key mappings

local function on_attach_config(_, bufnr)
  local keymap_opts = { noremap = true, silent = true, buffer = bufnr }

  local function buf_set_keymap(...)
    vim.keymap.set(...)
  end

  buf_set_keymap("n", "<leader>ö", vim.diagnostic.goto_prev, keymap_opts)
  buf_set_keymap("n", "<leader>ä", vim.diagnostic.goto_next, keymap_opts)

  buf_set_keymap("n", "<leader>a", vim.lsp.buf.code_action, keymap_opts)
  buf_set_keymap("n", "gd", vim.lsp.buf.definition, keymap_opts)
  buf_set_keymap("n", "gD", vim.lsp.buf.declaration, keymap_opts)
  buf_set_keymap("n", "gi", vim.lsp.buf.implementation, keymap_opts)
  buf_set_keymap("n", "gr", vim.lsp.buf.references, keymap_opts)
  buf_set_keymap("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
  buf_set_keymap("n", "K", vim.lsp.buf.hover, keymap_opts)
  buf_set_keymap("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
  buf_set_keymap("i", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)

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
nvim_lsp.cmake.setup(standardSetup)
nvim_lsp.eslint.setup(standardSetup)

nvim_lsp.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  on_attach = on_attach_config,
})

nvim_lsp.html.setup(standardSetup)
nvim_lsp.jsonls.setup(standardSetup)
nvim_lsp.pyright.setup(standardSetup)

-- rust
local rt = require("rust-tools")

rt.setup({
  tools = {
    autoSetHints = true,
    inlay_hints = {
      auto = false,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    on_attach = function(_, bufnr)
      on_attach_config(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,

    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
})

nvim_lsp.tsserver.setup(standardSetup)
nvim_lsp.zls.setup(standardSetup)

local lua_globals = { "vim" }
require("lspconfig").lua_ls.setup({
  on_attach = on_attach_config,
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
