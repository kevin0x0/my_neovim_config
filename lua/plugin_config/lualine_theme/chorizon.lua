-- lualine theme chorizon


local colors = {
    black        = '#1c1e26',
    red          = '#E95668',
    white        = '#E0E0E0',
    green        = '#09F7A0',
    blue         = '#379ae6',
    yellow       = '#E6E037',
    purple       = '#c893eb',
    cyan         = '#34BFB3',

    gray         = '#6C6F93',
    darkgray     = '#1A1C23',
    lightgray    = '#2E303E',
    inactivegray = '#1C1E26',
}

return {
    normal = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    insert = {
        a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    visual = {
        a = { bg = colors.purple, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    replace = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
    },
    inactive = {
        a = { bg = colors.inactivegray, fg = colors.lightgray, gui = 'bold' },
        b = { bg = colors.inactivegray, fg = colors.lightgray },
        c = { bg = colors.inactivegray, fg = colors.lightgray },
    },
    terminal = {
        a = { bg = colors.cyan, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
    }
}
