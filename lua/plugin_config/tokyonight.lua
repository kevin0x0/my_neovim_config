-- tokyonight.lua



local tn_theme = "tokyonight-storm"
require("tokyonight").setup({
    transparent = false,
    styles = {
        comments = { italic = false },
        keywords = { italic = false },
        siderbars = "dark",
    },

    siderbars = { "terminal", "help", "qf" },
    lualine_bold = false
})


