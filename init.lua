-- init.lua

-- required by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "user.options"
require "user.plugins"
require "user.keymaps".global(nil)

-- ensure all the packs are installed and be upgraded
-- vim.api.nvim_command"PackerSync"

-- plugins configuration here
require "plugin-config.bufferline"
require "plugin-config.nvim-tree"
require "plugin-config.toggleterm"
require "plugin-config.treesitter"
require "plugin-config.lualine"
require "plugin-config.telescope"
require "plugin-config.tokyonight"
require "plugin-config.lspkind"
require "plugin-config.cmp"
require "plugin-config.surround"
require "plugin-config.rainbow"
require "plugin-config.image"

-- lsp
require "lsp.setup"

-- visual configuration
require "user.visual".set_theme('everforest')
