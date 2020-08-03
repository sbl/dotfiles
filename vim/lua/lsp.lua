-- nvim-lsp config

local nvim_lsp = require('nvim_lsp')

-- use the attach callback to configure completion and key mappings
local function on_attach_config(o, bufnr)
  -- diagnostics
  vim.api.nvim_set_var('diagnostic_enable_virtual_text', 0)
  --vim.api.nvim_set_var('diagnostic_insert_delay', 1)
  require('diagnostic').on_attach()

  -- completion
  require('completion').on_attach()

  local caps = o.server_capabilities
  local opts = { noremap=true, silent=true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ö',     '<cmd>PrevDiagnosticCycle<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ä',     '<cmd>NextDiagnosticCycle<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',     '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',     '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',     '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',      '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0',     '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<f2>',   '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  if caps.documentFormattingProvider then
    -- use vim-go built-in formatting which uses goimports
    if o.name ~= "gopls" then
      vim.api.nvim_command([[au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]])
    end
  end
end

-- register and configure all servers
nvim_lsp.html.setup{ on_attach = on_attach_config }
nvim_lsp.clangd.setup{ on_attach = on_attach_config }
nvim_lsp.pyls.setup{ on_attach = on_attach_config }
nvim_lsp.gopls.setup{ on_attach = on_attach_config }
nvim_lsp.jsonls.setup{ on_attach = on_attach_config }

nvim_lsp.sumneko_lua.setup{
  on_attach = on_attach_config,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          -- vim
          "vim",
          -- norns
          "_norns",
          "_path",
          "arc",
          "audio",
          "clock",
          "crow",
          "enc",
          "engine",
          "grid",
          "hid",
          "include",
          "init",
          "key",
          "metro",
          "midi",
          "osc",
          "params",
          "redraw",
          "screen",
          "softcut",
          "util",

          -- crow
          "adsr",
          "ar",
          "input",
          "lfo",
          "lock",
          "loop",
          "output",
          "pulse",
          "ramp",
          "to",

          -- busted
          "describe",
          "it",
        }
      }
    }
  }
}
