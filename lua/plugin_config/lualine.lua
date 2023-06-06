-- lualine.lua


vim.opt.showmode = false
local enable_global_status = true

local function my_date()
    return os.date('%Y-%m-%d %H:%M:%S')
end

local function my_day_of_week()
    local days = { 'Sun.', 'Mon.', 'Tues.', 'Wed.', 'Thur.', 'Fri.', 'Sat.' }
    return days[os.date('%w') + 1]
end

-- constomize theme
local custom_horizon = require'lualine.themes.horizon'

custom_horizon.visual.a.bg = '#c893eb'
custom_horizon.replace.a.bg = '#f1fa8d'

require("lualine").setup({
    options = {
        icons_enabled = true, 
        theme = custom_horizon,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = enable_global_status,
        always_divided_middle = false
    },
    sections = {
        lualine_a = {
                'mode'
        },
        lualine_b = {
            {
                'branch',
                colored = true,
                color = { fg ='#00d91a' },
                icons_enabled = true,
                icon = { '', aligh = 'left', color = { fg = 'yellow' } }
            },
            {
              'diff',
              colored = true, -- Displays a colored diff status if set to true
              symbols = {added = ' ', modified = ' ', removed = ' '} -- Changes the symbols used by the diff.
            },
            {
                'diagnostics',
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                always_visible = false
            }
        },
        lualine_c = { { "require'lsp-status'.status()" }, { 'filename', colored = true, color = { fg = '#d0d0d0' } } },
        lualine_y = { 'filesize', 'progress', 'location' },
        lualine_z = { my_date }
    }
})

