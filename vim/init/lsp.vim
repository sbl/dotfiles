let g:vimsyn_embed= 'l'

sign define LspDiagnosticsSignError text=✘ texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=‼ texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=ℹ texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=H texthl=LspDiagnosticsSignHint linehl= numhl=


" ----------------------------------------------------------------

lua << EOF

-- nvim-lsp config
local nvim_lsp = require('lspconfig')

-- use the attach callback to configure completion and key mappings

local function on_attach_config(client, bufnr)
  -- completion
  require('completion').on_attach(client)

  local keymap_opts = { noremap=true, silent=true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l',     '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', keymap_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ö',     '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', keymap_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ä',     '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', keymap_opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',     '<cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',     '<cmd>lua vim.lsp.buf.implementation()<CR>', keymap_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',     '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',      '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0',     '<cmd>lua vim.lsp.buf.document_symbol()<CR>', keymap_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<f2>',   '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
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

---- register and configure all servers

nvim_lsp.clangd.setup{ on_attach = on_attach_config }
nvim_lsp.cmake.setup{ on_attach = on_attach_config }
nvim_lsp.gopls.setup{ on_attach = on_attach_config }
nvim_lsp.html.setup{ on_attach = on_attach_config }
nvim_lsp.jsonls.setup{ on_attach = on_attach_config }
nvim_lsp.pyright.setup{ on_attach = on_attach_config }
nvim_lsp.tsserver.setup{ on_attach = on_attach_config }

EOF
