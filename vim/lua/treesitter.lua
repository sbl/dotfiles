require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "cpp",
    "fish",
    "go",
    "javascript",
    "julia",
    "lua",
    "python",
    "rust",
    "supercollider",
    "typescript",
  },
  highlight = {
    enable = true,
    --disable = {"javascript", "typescript"}
  },
  indent = {
    enable = false,
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
  textobjects = { enable = false },
}


vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

au BufRead,BufNewFile *.fish set filetype=fish
au BufRead,BufNewFile *.jl set filetype=julia
]])
