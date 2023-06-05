-- plugins_config.lua



-- global



-- for tokyonight
local tn_theme = "tokyonight-storm"
require("tokyonight").setup({
    transparent = false,
    styles = {
        comments = { italic = false },
        keywords = { italic = false },
        siderbars = "dark",
    },
    
    siderbars = { "terminal", "help", "qf" },
    lualine_bold = false
})


-- for lualine
vim.opt.showmode = false
local enable_global_status = true

require("lualine").setup({
    options = {
        icons_enabled = true, 
        theme = "horizon",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = enable_global_status,
    },
    sections = {
        lualine_b = {
            {
                'branch'
            },
            {
                'diff'
            },
            {
                'diagnostics',
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                always_visible = false
            }
        }
    }
})



-- for bufferline
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


-- for nvim-treesitter  
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "cpp", "markdown", "make" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,
    auto_install = false,
    
    uighlight = { enable = true },
    incremental_selection = { enable = false }
})


-- for nvim-tree
local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')
    
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    
    vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
    vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
    vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
    vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
    vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
    vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
    vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
    vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
    vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
    vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
    vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
    vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
    vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
    vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
    vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
    vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
    vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
    vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
    vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
    vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
    vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
    vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
    vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
    vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
    vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
    vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
    vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
    vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
    vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
    vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
    vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
    vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
    vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
    vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
    vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
    vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
    vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
    vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
    vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
    vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
    vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
    vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
    vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
    vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
    vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
    vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
end


require("nvim-tree").setup({
    on_attach = my_on_attach
})


-- for toggleterm
require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,

    open_mapping = "<a-t>",
    -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
    -- on_open = fun(t: Terminal), -- function to run when the terminal opens
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
    -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
    -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
    hide_numbers = true,        -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    autochdir = false,          -- when neovim changes it current directory the terminal will change it's own when next it's opened
    -- highlights = {
    --   -- highlights which map to a highlight group name and a table of it's values
    --   -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    --   Normal = {
    --     guibg = "<VALUE-HERE>",
    --   },
    --   NormalFloat = {
    --     link = 'Normal'
    --   },
    --   FloatBorder = {
    --     guifg = "<VALUE-HERE>",
    --     guibg = "<VALUE-HERE>",
    --   },
    -- },
    shade_terminals = true,     -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    shading_factor = '-30',     -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
    start_in_insert = true,
    insert_mappings = true,     -- whether or not the open mapping applies in insert mode
    terminal_mappings = true,   -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = false,        -- if set to true (default) the previous terminal mode will be remembered
    direction = 'horizontal',
    close_on_exit = true,       -- close the terminal window when the process exits
    -- Change the default shell. Can be a string or a function returning a string
    shell = vim.o.shell,
    auto_scroll = true,         -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    -- float_opts = {
    --   -- The border key is almost the same as 'nvim_open_win'
    --   -- see :h nvim_open_win for details on borders however
    --   -- the 'curved' border is a custom border type
    --   -- not natively supported but implemented in this plugin.
    --   border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    --   -- like `size`, width and height can be a number or function which is passed the current terminal
    --   width = <value>,
    --   height = <value>,
    --   winblend = 3,
    --   zindex = <value>,
    -- },
    winbar = {
      enabled = true,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end
    }
})


-- for telescope
require("telescope").setup({})






