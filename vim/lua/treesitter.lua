require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    disable = true,
    enable = {
      "go",
      "fish",
      "javascript",
      "julia",
      "python",
      "toml",
      "typescript",
      "zig",
    },
  },
  indent = {
    disable = true,
    enable = {
      "fish",
      "julia",
      "toml",
      "zig",
      }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
      },
  },
  textobjects = { enable = true },
}

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

au BufRead,BufNewFile *.fish set filetype=fish
au BufRead,BufNewFile *.jl set filetype=julia
au BufRead,BufNewFile *.zig set filetype=zig
au BufRead,BufNewFile *.zir set filetype=zir
]])
