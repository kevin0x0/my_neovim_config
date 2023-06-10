-- gradient_echo.lua
--


local colors = {
  black        = '#1c1e26',
  red          = '#E95668',
  white        = '#B0B0B0',
  green        = '#09F7A0',
  blue         = '#379ae6',
  yellow       = '#E6E037', -- #f1fa8d
  purple       = '#c893eb',
  cyan         = '#34BFB3',
  pink         = '#FFC874',

  gray         = '#F43E5C',
  darkgray     = '#303030', --'#1A1C23',
  lightgray    = '#6E505E',
  highlightgray= '#7C6F93',
  inactivegray = '#1C1E26',
  dest         = '#101015', -- '#1c1e26', --'#393d38',
  dest_fg      = '#808080'

}

local function rcolor(color)
    local hex_num = color.sub(color, 2)
    local rcolor_dec = 16777215 - tonumber(hex_num, 16)
    return string.format('#%06X', rcolor_dec)
end

local function ctrans(from, to, level)
    local smoothness = 21
    level = level + smoothness - 6
    local r = (smoothness - level) * tonumber(from.sub(from, 2, 3), 16) / smoothness + level * tonumber(to.sub(to, 2, 3), 16) / smoothness
    local g = (smoothness - level) * tonumber(from.sub(from, 4, 5), 16) / smoothness + level * tonumber(to.sub(to, 4, 5), 16) / smoothness
    local b = (smoothness - level) * tonumber(from.sub(from, 6, 7), 16) / smoothness + level * tonumber(to.sub(to, 6, 7), 16) / smoothness
    return string.format('#%02X%02X%02X', r, g, b)
end

return {
  normal = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(colors.red, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(colors.red, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(colors.red, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(colors.red, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = ctrans(colors.red, colors.dest, 5), fg = colors.white }
  },
  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(colors.blue, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(colors.blue, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(colors.blue, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(colors.blue, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = ctrans(colors.blue, colors.dest, 5), fg = colors.white }
  },
  visual = {
    a = { bg = colors.purple, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(colors.purple, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(colors.purple, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(colors.purple, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(colors.purple, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = ctrans(colors.purple, colors.dest, 5), fg = colors.white }
  },
  replace = {
    a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(colors.yellow, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(colors.yellow, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(colors.yellow, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(colors.yellow, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = ctrans(colors.yellow, colors.dest, 5), fg = colors.white }
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(colors.green, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(colors.green, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(colors.green, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(colors.green, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = ctrans(colors.green, colors.dest, 5), fg = colors.white }
  },
  terminal = {
    a = { bg = colors.cyan, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(colors.cyan, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(colors.cyan, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(colors.cyan, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(colors.cyan, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = ctrans(colors.cyan, colors.dest, 5), fg = colors.white }
  },
  select = {
    a = { bg = colors.pink, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(colors.pink, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(colors.pink, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(colors.pink, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(colors.pink, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = ctrans(colors.pink, colors.dest, 5), fg = colors.white }
  },
  inactive = {
    a = { bg = colors.dest, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(colors.cyan, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(colors.cyan, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(colors.cyan, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(colors.cyan, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = ctrans(colors.cyan, colors.dest, 5), fg = colors.white }
  },
  -- inactive = {
  --   a = { bg = colors.inactivegray, fg = colors.lightgray, gui = 'bold' },
  --   b = { bg = colors.inactivegray, fg = colors.lightgray },
  --   c = { bg = colors.inactivegray, fg = colors.lightgray },
  -- },
}

