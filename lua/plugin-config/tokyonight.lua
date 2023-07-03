-- tokyonight.lua



require "tokyonight".setup({
  transparent = false,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    siderbars = "dark",
  },

  siderbars = { "terminal", "help", "qf" },
  lualine_bold = true
})
