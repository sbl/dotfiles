-- nvim-lsp config
local nvim_lsp = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- use the attach callback to configure completion and key mappings

local function on_attach_config(_, bufnr)
  local keymap_opts = { noremap=true, silent=true }

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  buf_set_keymap('n', '<leader>l',     '<cmd>lua vim.diagnostic.set_loclist()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>ö',     '<cmd>lua vim.diagnostic.goto_prev()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>ä',     '<cmd>lua vim.diagnostic.goto_next()<CR>', keymap_opts)

  buf_set_keymap('n', 'gd',     '<cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
  buf_set_keymap('n', 'gD',     '<cmd>lua vim.lsp.buf.declaration()<CR>', keymap_opts)
  buf_set_keymap('n', 'gi',     '<cmd>lua vim.lsp.buf.implementation()<CR>', keymap_opts)
  buf_set_keymap('n', 'gr',     '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
  buf_set_keymap('n', 'K',      '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
  buf_set_keymap('n', '<c-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  buf_set_keymap('i', '<c-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  buf_set_keymap('n', 'g0',     '<cmd>lua vim.lsp.buf.document_symbol()<CR>', keymap_opts)
  buf_set_keymap('n', '<F2>',   '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
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
--nvim_lsp.tsserver.setup(standardSetup)


-- go helpers

function goimports(timeout_ms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end


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
autocmd BufWritePre *.go lua goimports(1000)

command! A :ClangdSwitchSourceHeader

command! Format lua vim.lsp.buf.formatting()
]])

