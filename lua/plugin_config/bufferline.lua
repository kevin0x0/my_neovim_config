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


-- key mapping for bufferline
vim.keymap.set('n', '<a-]>', ':BufferLineCycleNext<CR>', opt)
vim.keymap.set('n', '<a-[>', ':BufferLineCyclePrev<CR>', opt)
vim.keymap.set('n', '<a-<Tab>>', ':BufferLineCycleNext<CR>', opt)

