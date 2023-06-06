-- lualine.lua


vim.opt.showmode = false
local enable_global_status = true

require("lualine").setup({
    options = {
        icons_enabled = true, 
        theme = "horizon",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = enable_global_status,
    },
    sections = {
        lualine_b = {
            {
                'branch'
            },
            {
                'diff'
            },
            {
                'diagnostics',
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                always_visible = false
            }
        }
    }
})


