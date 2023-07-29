-- plugins.lua


-- ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Now downloading lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  if not vim.loop.fs_stat(lazypath) then
    error("Failed to download lazy.nvim.")
  else
    print("Complete.")
  end
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require "lazy".setup({
  "wbthomason/packer.nvim",

  -- theme
  "folke/tokyonight.nvim",
  "lunarvim/darkplus.nvim",
  "joshdick/onedark.vim",
  "sainnhe/everforest",

  -- visual
  -- "nvim-tree/nvim-web-devicons",
  { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
  {
    "akinsho/bufferline.nvim",
    version = "v4.1.0",
    dependencies = "nvim-tree/nvim-web-devicons"
  },

  -- functional
  "nvim-treesitter/nvim-treesitter",
  { "akinsho/toggleterm.nvim",   version = 'v2.7.0' },
  { "nvim-tree/nvim-tree.lua",   dependencies = "nvim-tree/nvim-web-devicons" },
  { "nvim-telescope/telescope.nvim", version = "0.1.1", dependencies = "nvim-lua/plenary.nvim" },
  { "kylechui/nvim-surround",        version = "*" },
  "HiPhish/nvim-ts-rainbow2",

  -- lsp
  "neovim/nvim-lspconfig",

  -- coding
  -- nvim-cmp
  "hrsh7th/cmp-nvim-lsp",                -- { name = nvim_lsp }
  "hrsh7th/cmp-buffer",                  -- { name = 'buffer' },
  "hrsh7th/cmp-path",                    -- { name = 'path' }
  "hrsh7th/cmp-cmdline",                 -- { name = 'cmdline' }
  "hrsh7th/cmp-vsnip",                   -- { name = 'vsnip' }
  -- "hrsh7th/cmp-calc",                    -- { name = 'calc' }
  "hrsh7th/cmp-nvim-lsp-signature-help", -- { name = 'nvim_lsp_signature_help' }
  "hrsh7th/nvim-cmp",
  -- vsnip
  "hrsh7th/vim-vsnip",
  "rafamadriz/friendly-snippets",
  -- lspkind
  "onsails/lspkind-nvim",
  { "samodostal/image.nvim" , dependencies = { { "m00qek/baleia.nvim", version = 'v1.3.0' }, "nvim-lua/plenary.nvim" } },
})
