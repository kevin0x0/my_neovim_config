-- setup.lua

local caps = require 'cmp_nvim_lsp'.default_capabilities()
local lsp_default = require 'lspconfig'.util.default_config
lsp_default.capabilities = vim.tbl_deep_extend('force', lsp_default.capabilities, caps)

local function lsp_buf(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gr', function() require "telescope.builtin".lsp_references() end, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
end

local lspconfig = require("lspconfig")
local descpath = vim.fs.joinpath(vim.fn.stdpath('config'), "lua/lsp/languages") --- @diagnostic disable-line

for name, type in vim.fs.dir(descpath) do
  if type == 'file' then
    local desc = dofile(vim.fs.joinpath(descpath, name))
    local opts = desc.opts or {}
    opts.on_attach = opts.on_attach or lsp_buf
    lspconfig[desc.server].setup(opts)
  end
end
