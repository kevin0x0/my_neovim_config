-- colorscheme.lua

-- background
-- vim.o.background = dark

local normal_bg         = "#1B1D1E"
local normal_fg         = "bold"
local cursor_fg         = "bold"
local cursor_bg         = "#303030"

local error_fg          = "#e06c75"
local warn_fg           = "#e5c07b"
local info_fg           = "#61afef"
local hint_fg           = "#56b6c2"


local get_colors = function (mode)
  local colors = {}
  if mode == 'true-color' then
    colors = {
      lualine = {
        diagnostics = {
          error = { fg = error_fg },
          warn  = { fg = warn_fg },
          info  = { fg = info_fg },
          hint  = { fg = hint_fg },
        }
      }
    }
  else
    colors = {
      lualine = {
        diagnostics = {
          error = { fg = error_fg },
          warn  = { fg = warn_fg },
          info  = { fg = info_fg },
          hint  = { fg = hint_fg },
        }
      }
    }
  end
  return colors;
end


local get_icons = function(mode)
  local comp_sep_none = { left = '', right = '' }
  -- local comp_sep_tri = { left = '', right = '' }
  -- local comp_sep_cir = { left = '', right = '' }
  -- local comp_sep_tri_cir = { left = '', right = '' }
  -- local comp_sep_cir_tri = { left = '', right = '' }



  local sect_sep_none = { left = '', right = '' }
  -- local sect_sep_tri = { left = '', right = '' }
  -- local sect_sep_cir = { left = '', right = '' }
  -- local sect_sep_sla = { left = '', right = '' }
  -- local sect_sep_tri_cir = { left = '', right = '' }
  -- local sect_sep_cir_tri = { left = '', right = '' }
  local sect_sep_tri_sla = { left = '', right = '' }
  -- local sect_sep_sla_tri = { left = '', right = '' }
  -- local sect_sep_cir_sla = { left = '', right = '' }
  -- local sect_sep_sla_cir = { left = '', right = '' }
  local icons = {}
  if mode == 'true-color' then
    icons = {
      diagnostics = { error = '', warn = '', info = '', hint = '', },
      lualine = {
        diagnostics = { error = ' ', warn = ' ', info = ' ', hint = ' ', } ,
        diff = { added = ' ', modified = ' ', removed = ' ', },
        branch = '';
        section_separators = sect_sep_tri_sla,
        component_separators = comp_sep_none,
        left_separator = '',
        right_separator = '',
      },
      nvim_tree = {
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
        diagnostics = { hint = "", info = "", warning = "", error = "", },
      },
    }
  else
    icons = {
      diagnostics = { error = 'E', warn = 'W', info = 'I', hint = 'H', },
      lualine = {
        diagnostics = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ', } ,
        diff = { added = 'A ', modified = 'M ', removed = 'R ', },
        branch = 'B';
        section_separators = sect_sep_none,
        component_separators = comp_sep_none,
        left_separator = '',
        right_separator = '',
      },
      nvim_tree = {
        -- show = {
        --     file = true,
        --     folder = true,
        --     folder_arrow = true,
        --     git = false,
        -- },
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "v",
              arrow_closed = ">",
            },
            git = {
              -- unstaged = "x",
              unstaged = "X",
              -- staged = "S",
              staged = "S",
              unmerged = "U",
              renamed = "R",
              untracked = "",
              deleted = "D",
              ignored = "I",
            },
          },
        },
        diagnostics = { hint = "H", info = "I", warning = "W", error = "E", },
      }
    }
  end
  return icons
end

-- global visual configuration
local global_visual     = function(mode)
  -- make sure no trailing '~'.
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function(_)
      local nontext_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg#", "gui");
      if nontext_bg ~= "" then
        vim.api.nvim_command("hi EndOfBuffer           guifg=" .. nontext_bg .. " guibg=" .. nontext_bg)
      end
      nontext_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "cterm");
      if nontext_bg ~= "" then
        vim.api.nvim_command("hi EndOfBuffer           ctermfg=" .. nontext_bg .. " ctermbg=" .. nontext_bg)
      end
    end
  })
  -- background color
  vim.api.nvim_command("hi Normal                 guibg=" .. normal_bg)

  -- line number color
  vim.api.nvim_command("hi LineNr                 guifg=" .. normal_fg .. " guibg=" .. normal_bg)
  vim.api.nvim_command("hi SignColumn             guifg=" .. normal_fg .. " guibg=" .. normal_bg)

  -- cursorline highlight color
  vim.api.nvim_command("hi CursorLine             guifg=" .. cursor_fg .. " guibg=" .. cursor_bg)
  vim.api.nvim_command("hi CursorLineNr           guifg=" .. cursor_fg .. " guibg=" .. cursor_bg)

  -- floating window
  vim.api.nvim_command("hi Pmenu                  guibg=" .. normal_bg)
  vim.api.nvim_command("hi PmenuSel               guibg=" .. "gray")

  -- vim.api.nvim_command("hi DiagnosticError        guifg=" .. error_fg .. " guibg=" .. 'bg')
  -- vim.api.nvim_command("hi DiagnosticWarn         guifg=" .. warn_fg  .. " guibg=" .. 'bg')
  -- vim.api.nvim_command("hi DiagnosticInfo         guifg=" .. info_fg  .. " guibg=" .. 'bg')
  -- vim.api.nvim_command("hi DiagnosticHint         guifg=" .. hint_fg  .. " guibg=" .. 'bg')

  vim.api.nvim_command("hi DiagnosticSignError    guifg=" .. error_fg .. " guibg=" .. normal_bg)
  vim.api.nvim_command("hi DiagnosticSignWarn     guifg=" .. warn_fg .. " guibg=" .. normal_bg)
  vim.api.nvim_command("hi DiagnosticSignInfo     guifg=" .. info_fg .. " guibg=" .. normal_bg)
  vim.api.nvim_command("hi DiagnosticSignHint     guifg=" .. hint_fg .. " guibg=" .. normal_bg)

  -- icons for diagnostics
  local diagnostics_icons = get_icons(mode).diagnostics
  vim.fn.sign_define("DiagnosticSignError", { text = diagnostics_icons.error, texthl = "DiagnosticSignError", icon = nil })
  vim.fn.sign_define("DiagnosticSignWarn", { text = diagnostics_icons.warn, texthl = "DiagnosticSignWarn", icon = nil })
  vim.fn.sign_define("DiagnosticSignInfo", { text =diagnostics_icons.info, texthl = "DiagnosticSignInfo", icon = nil })
  vim.fn.sign_define("DiagnosticSignHint", { text =diagnostics_icons.hint, texthl = "DiagnosticSignHint", icon = nil })
end

local set_theme = function(theme)
  -- specify theme
  if theme then
    vim.api.nvim_command("colorscheme " .. theme)
  end
end

local mode = vim.opt.termguicolors and 'true-color' or '_'

global_visual(mode)
return {
  colors = get_colors(mode),
  icons = get_icons(mode),
  set_theme = set_theme,
}
