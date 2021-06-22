-- nvim-lsp config
local nvim_lsp = require('lspconfig')

-- use the attach callback to configure completion and key mappings

local function on_attach_config(client, bufnr)
  local keymap_opts = { noremap=true, silent=true }

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  buf_set_keymap('n', '<leader>l',     '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>ö',     '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>ä',     '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', keymap_opts)

  buf_set_keymap('n', 'gd',     '<cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
  buf_set_keymap('n', 'gD',     '<cmd>lua vim.lsp.buf.implementation()<CR>', keymap_opts)
  buf_set_keymap('n', 'gr',     '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
  buf_set_keymap('n', 'K',      '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
  buf_set_keymap('n', '<c-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  buf_set_keymap('i', '<c-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  buf_set_keymap('n', 'g0',     '<cmd>lua vim.lsp.buf.document_symbol()<CR>', keymap_opts)
  buf_set_keymap('n', '<f2>',   '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
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

nvim_lsp.clangd.setup{ on_attach = on_attach_config }
nvim_lsp.cmake.setup{ on_attach = on_attach_config }
nvim_lsp.gopls.setup{ on_attach = on_attach_config }
nvim_lsp.html.setup{ on_attach = on_attach_config }
nvim_lsp.jsonls.setup{ on_attach = on_attach_config }
nvim_lsp.pyright.setup{ on_attach = on_attach_config }
nvim_lsp.tsserver.setup{ on_attach = on_attach_config }

-- https://www.mitchellhanberg.com/how-to-set-up-neovim-for-elixir-development/
local path_to_elixirls = vim.fn.expand("~/src/elixir-ls/release/language_server.sh")
nvim_lsp.elixirls.setup({
  cmd = {path_to_elixirls},
  on_attach = on_attach_config,
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
    }
  }
})

-- vim escape hatch for config
vim.cmd([[
" signing

sign define LspDiagnosticsSignError text=✘ texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=‼ texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=ℹ texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=H texthl=LspDiagnosticsSignHint linehl= numhl=

" formatting where supported

autocmd BufWritePre *.{c,cc,cpp,h,hpp} lua vim.lsp.buf.formatting_sync(nil, 1000)
command! A :ClangdSwitchSourceHeader
command! Format lua vim.lsp.buf.formatting()
]])

