-- init.lua


-- required by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("user.options")
require("user.plugins")
require("user.keymaps")


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

require("user.colorscheme")


-- lsp
require("lsp.setup")





