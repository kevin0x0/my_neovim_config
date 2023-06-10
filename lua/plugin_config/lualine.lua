-- lualine.lua


vim.opt.showmode = false


local function show_message()
    -- return os.date('%Y-%m-%d %H:%M:%S');
    return ''
end



local comp_sep_none = { left = '', right = '' }
local comp_sep_tri = { left = '', right = '' }
local comp_sep_cir = { left = '', right = '' }
local comp_sep_tri_cir = { left = '', right = '' }
local comp_sep_cir_tri = { left = '', right = '' }



local sect_sep_none = { left = '', right = '' }
local sect_sep_tri = { left = '', right = '' }
local sect_sep_cir = { left = '', right = '' }
local sect_sep_sla = { left = '', right = '' }
local sect_sep_tri_cir = { left = '', right = '' }
local sect_sep_cir_tri = { left = '', right = '' }
local sect_sep_tri_sla = { left = '', right = '' }
local sect_sep_sla_tri = { left = '', right = '' }
local sect_sep_cir_sla = { left = '', right = '' }
local sect_sep_sla_cir = { left = '', right = '' }


-- specify theme here

local comp_sep = comp_sep_none
local sect_sep = sect_sep_tri_sla
local my_theme = require("plugin_config.lualine_theme.gradient_surround")

-- theme specification end

local enable_global_status = true



require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = my_theme,
        section_separators = sect_sep,
        component_separators = comp_sep,
        globalstatus = enable_global_status,
        always_divided_middle = false
    },
    sections = {
        lualine_a = {
            {
                'mode',
                -- fmt = function(str) return string.format('%-8s', str):sub(1, 8) end
                section_separators = { left = '' }
            }
        },
        lualine_b = {
            {
                'branch',
                colored = true,
                icons_enabled = true,
                icon = { '', aligh = 'left', color = { fg = 'yellow' } },
                -- component_separators = { left = '|' },
            },
            {
              'diff',
              colored = true, -- Displays a colored diff status if set to true
              symbols = {added = ' ', modified = ' ', removed = ' '}, -- Changes the symbols used by the diff.
            },
        },
        lualine_c = {
            { 'filename', colored = true, color = { fg = '#d1d0d0' } },
        },
        -- lualine_x = {
        --     { show_message , colored = true, color = { fg = '#6090b0' } },
        -- },
        lualine_x = {
            'encoding',
            {
                'fileformat',
                colored = true,
                color = { fg = '#FFFFFF' },
            },
        },
        lualine_y = {
            {
                'diagnostics',
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                always_visible = false,

                diagnostics_color = require'user.visual_design'.diagnostics_color,
                colored = true,           -- Displays diagnostics status in color if set to true.
            },
            {
                'filetype',
                -- colored = true,
                -- color = { fg = '#AAAAAA' },
            },
        },
        lualine_z = { { 'progress', section_separators = { right = '' } } , 'location' },-- { 'filesize', { row_col_prog } },
        -- lualine_z = { fmt_date }
    }
})


