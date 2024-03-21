-- keymaps.lua

local opt = { noremap = true, silent = true }

local function global_keymap(_)
  vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
  vim.keymap.set('i', 'jK', '<Esc>', { noremap = true })
  vim.keymap.set('i', 'Jk', '<Esc>', { noremap = true })
  vim.keymap.set('i', 'JK', '<Esc>', { noremap = true })
  -- vim.keymap.set('t', '<Esc>', [[<c-\><c-n>]], { noremap = true })

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

  -- fast operation
  vim.keymap.set('n', '<a-w>', ':w<CR>', opt)
  vim.keymap.set('n', '<a-q>', ':q<CR>', opt)

  -- lsp
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opt)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opt)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opt)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opt)
end

-- for cmp_keymap
local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local function cmp_keymap(cmp)
  local my_keymap = {
    ['<a-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<a-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<a-q>'] = cmp.mapping(cmp.mapping.close(), { 'i', 'c' }),
    ['<a-c>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<a-u>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c', 'n' }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 'c' }), -- accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<a-s-j>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    ['<a-s-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),

    ['<a-l>'] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      -- else
      --   fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { 'i', 's' }),

    ['<a-h>'] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { 'i', 's' }),
  }

  return my_keymap
end

local function bufferline_keymap(bufline)
  vim.keymap.set('n', '<a-]>', ':BufferLineCycleNext<CR>', opt)
  vim.keymap.set('n', '<a-[>', ':BufferLineCyclePrev<CR>', opt)
  -- vim.keymap.set('n', '<a-<Tab>>', ':BufferLineCycleNext<CR>', opt)
end

local function treesitter_keymap(treesitter)
  return {
    init_selection = "<M-s>",
    node_incremental = "<M-j>",
    scope_incremental = "<M-J>",
    node_decremental = "<M-k>",
  }
end

local function on_attach_for_nvimtree(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
  vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
  vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
  vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
  vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
  vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
  vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
  vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
  vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
  vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
  vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
  vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
  vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
  vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', '=', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
end


local function nvim_tree_keymap(nvimtree)
  vim.keymap.set('n', '<a-e>', ':NvimTreeToggle<CR>', opt)
  vim.keymap.set('n', '<a-f>', ':NvimTreeFocus<CR>', opt)

  return on_attach_for_nvimtree
end

local function toggleterm_keymap(toggleterm)
  return '<a-t>'
end

local function lsp_buf_keymap(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gr', function() require "telescope.builtin".lsp_references(require "telescope.themes".get_dropdown()) end, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
end

local function telescope_keymap()
  vim.keymap.set('n', '<space>fb', function() require "telescope.builtin".current_buffer_fuzzy_find() end, opt)
  vim.keymap.set('n', '<space>ff', function() require "telescope.builtin".find_files(require "telescope.themes".get_dropdown()) end, opt)
end

return {
  global = global_keymap,
  cmp = cmp_keymap,
  bufferline = bufferline_keymap,
  nvim_tree = nvim_tree_keymap,
  toggleterm = toggleterm_keymap,
  lsp_buf = lsp_buf_keymap,
  treesitter = treesitter_keymap,
  telescope_keymap = telescope_keymap,
}
