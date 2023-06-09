-- bufferline.lua


vim.opt.termguicolors = true

require("bufferline").setup({
    options = {
        mode = "buffers",
        numbers = "buffer_id",
        indicator = { icon = '▎', style = 'icon' },
        separator_style = { '  ', '  ' }, --if this does not work, try paddef_slop
        sort_by = "relative_directory",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon
            if level:match('error') then
                icon = ' '
            elseif level:match('warn') then
                icon = ' '
            elseif level:match('hint') then
                icon = ' '
            else
                icon = ' '
            end
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true
            }
        }
    }
})



