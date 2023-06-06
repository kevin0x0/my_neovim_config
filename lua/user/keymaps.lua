-- keymaps.lua


local opt = { noremap = true, silent = true }




vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('t', '<Esc>', [[<c-\><c-n>]], { noremap = true })



-- switch window
vim.keymap.set('n', '<a-h>', '<C-w>h', opt)
vim.keymap.set('n', '<a-j>', '<C-w>j', opt)
vim.keymap.set('n', '<a-k>', '<C-w>k', opt)
vim.keymap.set('n', '<a-l>', '<C-w>l', opt)

-- adjust window
vim.keymap.set('n', '<a-Up>', ':resize -1<CR>', opt)
vim.keymap.set('n', '<a-Down>', ':resize +1<CR>', opt)
vim.keymap.set('n', '<a-Left>', ':vertical resize -1<CR>', opt)
vim.keymap.set('n', '<a-Right>', ':vertical resize +1<CR>', opt)

-- move window
vim.keymap.set('n', '<a-S-h>', '<C-w>H', opt)
vim.keymap.set('n', '<a-S-j>', '<C-w>J', opt)
vim.keymap.set('n', '<a-S-k>', '<C-w>K', opt)
vim.keymap.set('n', '<a-S-l>', '<C-w>L', opt)

-- <Leader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- fast oparation
vim.keymap.set('n', '<Leader>w', ':w<CR>', opt)
vim.keymap.set('n', '<Leader>q', ':q<CR>', opt)






