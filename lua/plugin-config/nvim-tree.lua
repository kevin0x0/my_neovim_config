-- nvim-tree.lua




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
    -- float = { enable = true, open_win_config = { border = "shadow" } },
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

    icons = {
      -- show = {
      --     file = true,
      --     folder = true,
      --     folder_arrow = true,
      --     git = false,
      -- },

      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          -- unstaged = "✗",
          unstaged = "",
          -- staged = "✓",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}



require("nvim-tree").setup(options)
