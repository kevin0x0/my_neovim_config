-- nvim-tree.lua

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local options = {
  on_attach = require 'user.keymaps'.nvim_tree(nil),
  -- filters = {
  --     dotfiles = false,
  --     exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  -- },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = "left",
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
    width = 30,
    preserve_window_proportions = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_label = true,
    highlight_git = false,
    highlight_opened_files = '#FFFFFF',

    indent_markers = {
      enable = true,
    },

    icons = require 'user.visual'.icons.nvim_tree.icons,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = require 'user.visual'.icons.nvim_tree.diagnostics,
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    disable_for_dirs = {},
    timeout = 400,
  },
}

require("nvim-tree").setup(options)
