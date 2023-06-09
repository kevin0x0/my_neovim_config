-- colorscheme.lua


-- background
-- vim.o.background = dark

local normal_bg = "#1B1D1E"
local normal_fg = "bold"
local cursor_fg = "bold"
local cursor_bg = "#303030"

local error_fg  = "#e06c75"
local warn_fg   = "#e5c07b"
local info_fg   = "#61afef"
local hint_fg   = "#56b6c2"


-- background color
vim.api.nvim_command("hi Normal guibg=" .. normal_bg)

-- line number color
vim.api.nvim_command("hi LineNr         guifg=" .. normal_fg .. " guibg=" .. normal_bg)
vim.api.nvim_command("hi SignColumn     guifg=" .. normal_fg .. " guibg=" .. normal_bg)

-- cursorline highlight color
vim.api.nvim_command("hi CursorLine     guifg=" .. cursor_fg .. " guibg=" .. cursor_bg)
vim.api.nvim_command("hi CursorLineNr   guifg=" .. cursor_fg .. " guibg=" .. cursor_bg)

vim.api.nvim_command("hi NonText        guifg=" .. normal_bg .. " guibg=" .. normal_bg)

-- floating window
vim.api.nvim_command("hi Pmenu          guibg=" .. normal_bg)
vim.api.nvim_command("hi PmenuSel       guibg=" .. "gray")


vim.api.nvim_command("hi DiagnosticSignError guifg=" .. error_fg .. " guibg=" .. normal_bg)
vim.api.nvim_command("hi DiagnosticSignWarn  guifg=" .. warn_fg  .. " guibg=" .. normal_bg)
vim.api.nvim_command("hi DiagnosticSignInfo  guifg=" .. info_fg  .. " guibg=" .. normal_bg)
vim.api.nvim_command("hi DiagnosticSignHint  guifg=" .. hint_fg  .. " guibg=" .. normal_bg)


-- icons for diagnostics
vim.fn.sign_define("DiagnosticSignError", { text = '', texthl = "DiagnosticSignError", icon = nil })
vim.fn.sign_define("DiagnosticSignWarn", { text = '' , texthl = "DiagnosticSignWarn", icon = nil })
vim.fn.sign_define("DiagnosticSignInfo", { text = '' , texthl = "DiagnosticSignInfo", icon = nil })
vim.fn.sign_define("DiagnosticSignHint", { text = '' , texthl = "DiagnosticSignHint", icon = nil })


-- specify theme

local theme = "onedark"
vim.api.nvim_command("colorscheme " .. theme)


