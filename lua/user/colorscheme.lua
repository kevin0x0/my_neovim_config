-- colorscheme.lua


-- background
vim.o.background = dark

-- background color
vim.api.nvim_command("hi Normal guibg=#1B1D1E")

-- line number color
vim.api.nvim_command("hi LineNr term=bold cterm=bold ctermfg=White ctermbg=Black guifg=bold guibg=#232526")

-- cursorline highlight color
vim.api.nvim_command("hi CursorLine term=bold cterm=bold ctermbg=Black guifg=bold guibg=#303030")
vim.api.nvim_command("hi CursorLineNr term=bold cterm=bold ctermfg=White ctermbg=Black guifg=bold guibg=#303030")


-- specify theme

local theme = "onedark"
vim.api.nvim_command("colorscheme " .. theme)




