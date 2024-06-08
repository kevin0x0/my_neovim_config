-- treesitter.lua


require "nvim-treesitter.configs".setup({
  ensure_installed = {
    "c",
    "lua",
    "cpp",
    "markdown",
    "markdown_inline",
    "make",
    "c_sharp",
    "python",
    "verilog",
    "cuda",
    "haskell",
    "java",
    "javascript",
    "css",
    "html",
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = false,

  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = require "user.keymaps".treesitter(nil),
  },
})
