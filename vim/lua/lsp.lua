-- nvim-lsp config
local nvim_lsp = require("lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local rt = require("rust-tools")

-- use the attach callback to configure completion and key mappings

local function on_attach_config(_, bufnr)
  local keymap_opts = { noremap = true, silent = true }

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  buf_set_keymap("n", "<leader>ö", "<cmd>lua vim.diagnostic.goto_prev()<CR>", keymap_opts)
  buf_set_keymap("n", "<leader>ä", "<cmd>lua vim.diagnostic.goto_next()<CR>", keymap_opts)

  buf_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", keymap_opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keymap_opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", keymap_opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", keymap_opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", keymap_opts)
  buf_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", keymap_opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keymap_opts)
  buf_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", keymap_opts)
  buf_set_keymap("i", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", keymap_opts)
  buf_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", keymap_opts)
  buf_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", keymap_opts)
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
--nvim_lsp.zls.setup(standardSetup)

local lua_globals = { "vim" }
require("lspconfig").sumneko_lua.setup({
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
