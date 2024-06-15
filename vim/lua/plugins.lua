require('plugins.lsp')
require('plugins.completion')
require('plugins.treesitter')
require('plugins.conform')
require('plugins.lint')

require('mason').setup({
  ui = {
    check_outdated_packages_on_open = false,
  }
})
require('mason-lspconfig').setup({
  automatic_installation = {
    exclude = { "zls" },
  }
})

require("luasnip.loaders.from_snipmate").lazy_load()
require('nvim-ts-autotag').setup {}

require('symbols-outline').setup()

require("trouble").setup { mode = "document_diagnostics" }
require('nvim-tree').setup({
  git = {
    enable = true,
  },
  filters = {
    custom = { ".git" },
  },
})
