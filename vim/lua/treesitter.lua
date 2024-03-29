require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "cpp",
    "fish",
    "go",
    "html",
    "javascript",
    "lua",
    "python",
    "rust",
    "supercollider",
    "typescript",
    "zig",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
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
}


vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])
