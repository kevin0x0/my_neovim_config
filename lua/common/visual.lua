-- global visual configuration
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

    -- fix hover markdown highlight
    vim.api.nvim_command("hi! link NormalFloat Pmenu");
  end
})

-- fix gruvbox
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "gruvbox",
  callback = function(_)
    -- fix cursorline highlight
    vim.api.nvim_command("hi! link Operator GruvboxFg0");
    -- fix variable
    vim.api.nvim_command("hi! link Indentifier GruvboxBlue");
    vim.api.nvim_command("hi! link @variable Indentifier");
    vim.api.nvim_command("hi! link @lsp.type.variable Indentifier");
    -- fix function-like macro
    vim.api.nvim_command("hi! link @lsp.type.macro GruvboxAqua");
  end
})

-- icons for diagnostics
local diagnostics_icons = {
  hint = "",
  info = "",
  warning = "",
  error = "",
}

vim.fn.sign_define("DiagnosticSignError", { text = diagnostics_icons.error, texthl = "DiagnosticSignError", icon = nil })
vim.fn.sign_define("DiagnosticSignWarn", { text = diagnostics_icons.warn, texthl = "DiagnosticSignWarn", icon = nil })
vim.fn.sign_define("DiagnosticSignInfo", { text =diagnostics_icons.info, texthl = "DiagnosticSignInfo", icon = nil })
vim.fn.sign_define("DiagnosticSignHint", { text =diagnostics_icons.hint, texthl = "DiagnosticSignHint", icon = nil })
