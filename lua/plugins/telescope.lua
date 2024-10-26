local opt = { noremap = true, silent = true }
vim.keymap.set('n', '<space>fb', function() require "telescope.builtin".current_buffer_fuzzy_find() end, opt)
vim.keymap.set('n', '<space>ff', function() require "telescope.builtin".find_files() end, opt)

return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.8",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {},
}
