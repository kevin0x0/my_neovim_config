-- lualine.lua


vim.opt.showmode = false


-- specify theme here
-- local my_theme = require("plugin-config.lualine-theme.gradient-surround")

-- theme specification end

local enable_global_status = true


require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    section_separators = { left = "", right ="" },
    component_separators = { left = "", right ="" },
    -- section_separators = require 'user.visual'.icons.lualine.section_separators,
    -- component_separators = require 'user.visual'.icons.lualine.component_separators,
    globalstatus = enable_global_status,
    always_divided_middle = false
  },
  -- sections = {
  --   lualine_a = {
  --     {
  --       'mode',
  --       -- fmt = function(str) return string.format('%-8s', str):sub(1, 8) end
  --       section_separators = { left = require 'user.visual'.icons.lualine.left_separator },
  --     }
  --   },
  --   lualine_b = {
  --     {
  --       'branch',
  --       colored = true,
  --       icons_enabled = true,
  --       icon = { require 'user.visual'.icons.lualine.branch, aligh = 'left', color = { fg = 'yellow' } },
  --       -- component_separators = { left = '|' },
  --     },
  --     {
  --       'diff',
  --       colored = true,                                                    -- Displays a colored diff status if set to true
  --       symbols = require 'user.visual'.icons.lualine.diff, -- Changes the symbols used by the diff.
  --       -- diff_color = { added = { fg = '#B0D090' } },
  --     },
  --     {
  --       'diagnostics',
  --       sections = { 'error', 'warn', 'info', 'hint' },
  --       symbols = require 'user.visual'.icons.lualine.diagnostics,
  --       always_visible = false,

  --       diagnostics_color = require 'user.visual'.colors.lualine.diagnostics,
  --       colored = true,         -- Displays diagnostics status in color if set to true.
  --     },
  --   },
  --   lualine_c = {
  --     { 'filename', colored = true, color = { fg = '#d1d0d0' } },
  --   },
  --   -- lualine_x = {
  --   --     { show_message , colored = true, color = { fg = '#6090b0' } },
  --   -- },
  --   lualine_x = {
  --     {
  --       function()
  --         local info = vim.lsp.buf_get_clients();
  --         if (not info) or (not info[1]) then
  --           return ""
  --         end
  --         return info[1].name
  --       end,
  --       colored = true;
  --       color = { fg = '#55AAEE' },
  --     },
  --   },
  --   lualine_y = {
  --     {
  --       'encoding',
  --       fmt = string.upper,
  --       colored = true,
  --       color = { fg = '#FFFFFF' },
  --     },
  --     {
  --       'filetype',
  --       colored = true,
  --       color = { fg = '#FFFFFF' },
  --     },
  --     {
  --       'fileformat',
  --       colored = true,
  --       color = { fg = '#FFFFFF' },
  --     },
  --   },
  --   lualine_z = { { 'progress', section_separators = { right = require 'user.visual'.icons.lualine.right_separator } }, 'location' },    -- { 'filesize', { row_col_prog } },
  --   -- lualine_z = { fmt_date }
  -- }
})
