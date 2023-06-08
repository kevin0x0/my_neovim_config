-- c_cpp.lua



local lspconfig = require("lspconfig")
local call_back = require('lsp.buf_keymap')

lspconfig.clangd.setup({
    on_attach = call_back,
})
