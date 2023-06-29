-- html.lua



local lspconfig = require("lspconfig")
local lsp_buf = require('user.keymaps').lsp_buf

lspconfig.html.setup({
  on_attach = lsp_buf,
})
