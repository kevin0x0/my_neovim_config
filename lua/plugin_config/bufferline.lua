-- bufferline.lua


vim.opt.termguicolors = true

require("bufferline").setup({
    options = {
        mode = "buffers",
        numbers = "buffer_id",
        indicator = { icon = ' ', stype = 'underline' },
        separator_style = "slope", --if this does not work, try paddef_slop
        sort_by = "relative_directory",
        -- diagnostics = "nvim_lsp" | "coc",
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


