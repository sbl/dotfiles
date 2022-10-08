-- nvim-lsp config
local nvim_lsp = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- use the attach callback to configure completion and key mappings

local function on_attach_config(_, bufnr)
  local keymap_opts = { noremap=true, silent=true }

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  buf_set_keymap('n', '<leader>ö',     '<cmd>lua vim.diagnostic.goto_prev()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>ä',     '<cmd>lua vim.diagnostic.goto_next()<CR>', keymap_opts)

  buf_set_keymap('n', '<leader>a',  '<cmd>lua vim.lsp.buf.code_action()<CR>', keymap_opts)
  buf_set_keymap('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
  buf_set_keymap('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>', keymap_opts)
  buf_set_keymap('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>', keymap_opts)
  buf_set_keymap('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
  buf_set_keymap('n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
  buf_set_keymap('n', '<c-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  buf_set_keymap('i', '<c-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  buf_set_keymap('n', 'g0',         '<cmd>lua vim.lsp.buf.document_symbol()<CR>', keymap_opts)
  buf_set_keymap('n', '<F2>',       '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
end

-- diagnostic config

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

-- register and configure all servers

local standardSetup = {
  on_attach = on_attach_config,
  capabilities = cmp_capabilities,
}

nvim_lsp.clangd.setup(standardSetup)
nvim_lsp.cmake.setup(standardSetup)
nvim_lsp.gopls.setup{
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  on_attach = on_attach_config }
nvim_lsp.html.setup(standardSetup)
nvim_lsp.jsonls.setup(standardSetup)
nvim_lsp.pyright.setup(standardSetup)
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach_config,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})
nvim_lsp.tsserver.setup{}

nvim_lsp.zls.setup(standardSetup)



local lua_globals = { 'vim' }
require'lspconfig'.sumneko_lua.setup {
  on_attach=on_attach_config,
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

    }
  }
}

nvim_lsp.eslint.setup(standardSetup)


-- vim escape hatch for config
vim.cmd([[
" signing

sign define LspDiagnosticsSignError text=✘ texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=‼ texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=ℹ texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=H texthl=LspDiagnosticsSignHint linehl= numhl=

" formatting where supported

autocmd BufWritePre *.{c,cc,cpp,h,hpp} lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()

command! Format lua vim.lsp.buf.formatting()
]])

