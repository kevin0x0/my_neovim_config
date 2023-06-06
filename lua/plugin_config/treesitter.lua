-- treesitter.lua


require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "cpp", "markdown", "make" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,
    auto_install = false,
    
    highlight = { enable = true },
    incremental_selection = { enable = false }
})
