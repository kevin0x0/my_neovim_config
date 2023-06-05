-- init.lua


-- required by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



require("user.options")

require("user.plugins")

-- ensure all the packs are installed and be upgraded
vim.api.nvim_command("PackerSync")

require("user.plugins_config")

require("user.colorscheme")

require("user.keymaps")





