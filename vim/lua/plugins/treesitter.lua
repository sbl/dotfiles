require 'nvim-treesitter'
require 'nvim-treesitter.configs'.setup({
  ensure_installed = {
    "c",
    "cmake",
    "cpp",
    "elixir",
    "heex",
    "eex",
    "fish",
    "go",
    "gomod",
    "gosum",
    "html",
    "javascript",
    "lua",
    "python",
    "ruby",
    "rust",
    "templ",
    "typescript",
    "vim",
    "vimdoc",
    "zig",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    disable = { "html", "javascript", "typescript" }
  },
  indent = {
    enable = true,
    disable = { "javascript", "typescript" }
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
})