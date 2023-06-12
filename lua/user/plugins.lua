-- plugins.lua


vim.cmd [[packadd packer.nvim]]

return require "packer".startup(function(use)
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
  use { "kylechui/nvim-surround", tag = "*" }

  -- lsp
  use "neovim/nvim-lspconfig"

  -- coding
  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'                -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'                  -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'                    -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'                 -- { name = 'cmdline' }
  use 'hrsh7th/cmp-vsnip'                   -- { name = 'vsnip' }
  use 'hrsh7th/cmp-calc'                    -- { name = 'calc' }
  use 'hrsh7th/cmp-nvim-lsp-signature-help' -- { name = 'nvim_lsp_signature_help' }
  use 'hrsh7th/nvim-cmp'
  -- vsnip
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'
end)
