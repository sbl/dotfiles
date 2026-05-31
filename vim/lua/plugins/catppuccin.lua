return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- main colorscheme, load on startup
    priority = 1000, -- load before other plugins
    config = function()
      require("catppuccin").setup({
        -- `auto` picks the flavour from the background map based on &background,
        -- which Neovim auto-detects from the terminal (OSC 11). This follows
        -- Ghostty's light/dark theme, which follows the macOS appearance.
        flavour = "auto",
        background = {
          light = "latte",
          dark = "frappe",
        },
      })
    end,
  },
}
