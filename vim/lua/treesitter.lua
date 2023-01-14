require 'nvim-treesitter'
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "cpp",
    "elixir",
    "heex",
    "eex",
    "fish",
    "go",
    "gomod",
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
    additional_vim_regex_highlighting = false,
    --disable = {"javascript", "typescript"}
  },
  -- see if it works?
  indent = {
    enable = true,
  },
  endwise = {
    enable = true,
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

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
