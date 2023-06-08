-- lualine.lua


vim.opt.showmode = false


local function fmt_date()
    return os.date('%Y-%m-%d %H:%M:%S');
end


local function lsp_status()
    local cap = vim.lsp.buf.server_capabilities()
    if not cap then
        return ''
    else 
        local server_info = cap.serverInfo
        if not server_info then
            return ''
        else
            return server_info.name .. server_info.version
        end
    end
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
local my_theme = require("plugin_config.lualine_theme.gradient_echo")

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
                'mode'
                -- fmt = function(str) return string.format('%-8s', str):sub(1, 8) end
            }
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
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                always_visible = false
            }
        },
        lualine_c = {
            { lsp_status , colored = true, color = { fg = '#304090' } },
            { 'filename', colored = true, color = { fg = '#d1d0d0' } }
        },
        lualine_x = { 'encoding', 'filetype', 'fileformat' },
        lualine_y = { 'progress', 'location' },-- { 'filesize', { row_col_prog } },
        lualine_z = { fmt_date }
    }
})


