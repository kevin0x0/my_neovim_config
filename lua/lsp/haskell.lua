-- haskell.lua

local lspconfig = require("lspconfig")
local lsp_buf = require('user.keymaps').lsp_buf

lspconfig.hls.setup({
  on_attach = lsp_buf,
})
