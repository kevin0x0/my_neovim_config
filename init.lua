-- init.lua

-- required by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("user.options")
require("user.plugins")
require("user.keymaps").global(nil)

-- ensure all the packs are installed and be upgraded
-- vim.api.nvim_command("PackerSync")

-- plugins configuration here
require("plugin_config.bufferline")
require("plugin_config.nvim_tree")
require("plugin_config.toggleterm")
require("plugin_config.treesitter")
require("plugin_config.lualine")
require("plugin_config.telescope")
require("plugin_config.tokyonight")
require("plugin_config.cmp")
require("plugin_config.surround")

-- lsp
require("lsp.setup")

-- visual configuration
require("user.visual_design").global('onedark')


