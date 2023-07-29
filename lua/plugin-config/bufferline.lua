-- bufferline.lua


vim.opt.termguicolors = true

local diagnostics_icons = require 'user.visual'.icons.lualine.diagnostics

require("bufferline").setup({
  options = {
    mode = "buffers",
    numbers = "buffer_id",
    indicator = { icon = '▎', style = 'icon' },
    separator_style = { '  ', '  ' },     --if this does not work, try paddef_slop
    sort_by = "relative_directory",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon
      if level:match('error') then
        icon = diagnostics_icons.error
      elseif level:match('warn') then
        icon = diagnostics_icons.warn
      elseif level:match('hint') then
        icon = diagnostics_icons.hint
      else
        icon = diagnostics_icons.info
      end
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true
      }
    }
  }
})

require 'user.keymaps'.bufferline(nil)

