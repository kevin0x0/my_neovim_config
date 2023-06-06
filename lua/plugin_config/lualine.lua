-- lualine.lua


vim.opt.showmode = false



local function my_date()
    return os.date('%Y-%m-%d %H:%M:%S')
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



-- specify theme here

local comp_sep = comp_sep_none
local sect_sep = sect_sep_tri_sla
local my_theme = require("plugin_config.lualine_theme.gradient_deep")

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
                'mode'
        },
        lualine_b = {
            {
                'branch',
                colored = true,
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
        lualine_y = { 'filesize', 'progress', 'location' },-- { 'filesize', { row_col_prog } },
        lualine_z = { my_date }
    }
})

