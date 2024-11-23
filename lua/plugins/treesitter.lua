local language = {
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

  -- my language
  "klang",
}

local mylangs = {
  klang = {
    install_info = {
      url = "https://github.com/kevin0x0/tree-sitter-klang",
      files = { "src/parser.c" },
      branch = "main",
      requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    }
  }
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = language,
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = false,

    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<M-s>",
        node_incremental = "<M-j>",
        scope_incremental = "<M-J>",
        node_decremental = "<M-k>",
      },
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    -- install parser for my language
    local config = require "nvim-treesitter.parsers".get_parser_configs()
    for lang, info in pairs(mylangs) do
      config[lang] = info
    end

    require "nvim-treesitter.configs".setup(opts)
  end
}
