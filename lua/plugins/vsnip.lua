local snippetspath =  vim.fs.joinpath(vim.fn.stdpath("config"), "/lua/config/snippets") --- @diagnostic disable-line
return {
  "hrsh7th/vim-vsnip",
  init = function()
    vim.g.vsnip_snippet_dirs = { snippetspath }
  end,
}
