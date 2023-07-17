-- treesitter.lua


require "nvim-treesitter.configs".setup({
  ensure_installed = { "c", "lua", "cpp", "markdown", "make", "c_sharp", "python" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = false,

  highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = require "user.keymaps".treesitter(nil),
    },
})
