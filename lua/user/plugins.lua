-- plugins.lua


vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- theme
    use "folke/tokyonight.nvim"
    use "lunarvim/darkplus.nvim"
    use "joshdick/onedark.vim"
    
    -- visual
    use "nvim-tree/nvim-web-devicons"
    use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }
    use { "akinsho/bufferline.nvim", tag = "v4.1.0", requires = "nvim-tree/nvim-web-devicons" }

    -- functional
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "akinsho/toggleterm.nvim", tag = 'v2.7.0' }
    use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }
    use "nvim-lua/plenary.nvim"
    use { "nvim-telescope/telescope.nvim", tag = "0.1.1", requires = { { "nvim-lua/plenary.nvim" } } }

    -- lsp
    use "neovim/nvim-lspconfig"
end)


