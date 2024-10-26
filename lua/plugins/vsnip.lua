return {
  "hrsh7th/vim-vsnip",
  init = function()
    vim.g.vsnip_snippet_dirs = { vim.fn.stdpath("config") .. "/lua/plugin-config/snippets" }
  end,
}
