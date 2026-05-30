return {
  {
    "gbprod/nord.nvim",
    lazy = true, -- kept installed; load on demand via `:colorscheme nord`
    config = function()
      require("nord").setup({})
    end,
  },
}
