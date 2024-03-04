-- setup.lua




local caps = require 'cmp_nvim_lsp'.default_capabilities()
local lsp_default = require 'lspconfig'.util.default_config
lsp_default.capabilities = vim.tbl_deep_extend('force', lsp_default.capabilities, caps)


require("lsp.lua")
require("lsp.c_cpp")
require("lsp.haskell")
require("lsp.python")
require("lsp.html")
require("lsp.verilog")
