-- options.lua


-- line number
vim.opt.number = true
vim.opt.rnu = true

vim.opt.wrap = false

-- show matching parenthesis
-- vim.opt.showmatch = true

-- indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.autoindent = true
vim.opt.shiftwidth = 2

-- show command
vim.opt.showcmd = true

-- windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- search
vim.opt.hlsearch = false
vim.opt.ignorecase = false


-- enable true colors
vim.opt.termguicolors = true

-- enable cursorline highlight
vim.opt.cursorline = true

vim.diagnostic.config({ severity_sort = true })
