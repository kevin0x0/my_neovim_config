-- init.lua


require "user.options"
require "user.plugins"
require "user.keymaps".global(nil)

-- ensure all the packs are installed and be upgraded
-- vim.api.nvim_command"PackerSync"

-- lsp
require "lsp.setup"

-- visual configuration
require "user.visual".set_theme("onedark")

-- fix cursorline highlight
-- vim.api.nvim_command("hi link Operator GruvboxFg0");
