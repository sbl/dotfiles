local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end


-- setup
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.ruff, --python formatting in addition to ruff-LSP
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.stylua,

  },
  -- you can reuse a shared lspconfig on_attach callback here

  on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    buf_set_keymap("n", "<leader>ö", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
    buf_set_keymap("n", "<leader>ä", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            timeout_ms = 1000,
          })
        end,
      })
    end
  end,
})
