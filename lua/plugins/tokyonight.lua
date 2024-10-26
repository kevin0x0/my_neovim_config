return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    transparent = false,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      siderbars = "dark",
    },

    siderbars = { "terminal", "help", "qf" },
    lualine_bold = true
  },
}
