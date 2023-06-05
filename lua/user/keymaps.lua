-- keymaps.lua


local opt = { noremap = true, silent = true }




vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('t', '<Esc>', [[<c-\><c-n>]], { noremap = true })



-- checkout window
vim.keymap.set('n', '<C-h>', '<C-w>h', opt)
vim.keymap.set('n', '<C-j>', '<C-w>j', opt)
vim.keymap.set('n', '<C-k>', '<C-w>k', opt)
vim.keymap.set('n', '<C-l>', '<C-w>l', opt)

-- adjust window
vim.keymap.set('n', '<C-Up>', ':resize -1<CR>', opt)
vim.keymap.set('n', '<C-Down>', ':resize +1<CR>', opt)
vim.keymap.set('n', '<C-Left>', ':vertical resize -1<CR>', opt)
vim.keymap.set('n', '<C-Right>', ':vertical resize +1<CR>', opt)

-- move window
vim.keymap.set('n', '<a-S-h>', '<C-w>H', opt)
vim.keymap.set('n', '<a-S-j>', '<C-w>J', opt)
vim.keymap.set('n', '<a-S-k>', '<C-w>K', opt)
vim.keymap.set('n', '<a-S-l>', '<C-w>L', opt)

-- fast oparation
vim.keymap.set('n', '<Leader>w', ':w<CR>', opt)
vim.keymap.set('n', '<Leader>q', ':q<CR>', opt)

-- <Leader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<Leader>w', ':w<CR>', opt)

-- mapping for bufferline
vim.keymap.set('n', '<a-j>', ':BufferLineCycleNext<CR>', opt)
vim.keymap.set('n', '<a-l>', ':BufferLineCycleNext<CR>', opt)
vim.keymap.set('n', '<a-k>', ':BufferLineCyclePrev<CR>', opt)
vim.keymap.set('n', '<a-h>', ':BufferLineCyclePrev<CR>', opt)
vim.keymap.set('n', '<a-<Tab>>', ':BufferLineCycleNext<CR>', opt)

-- mapping for nvim-tree
vim.keymap.set('n', '<a-e>', ':NvimTreeToggle<CR>', opt)
vim.keymap.set('n', '<a-f>', ':NvimTreeFocus<CR>', opt)




