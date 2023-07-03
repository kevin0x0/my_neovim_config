-- gradient_echo.lua
--


local colors = {
  black         = '#1c1e26',
  red           = '#E95668',
  white         = '#B0B0B0',
  green         = '#09F7A0',
  blue          = '#379ae6',
  yellow        = '#E6E037', -- #f1fa8d
  purple        = '#c893eb',
  cyan          = '#34BFB3',
  pink          = '#FFC874',
  grass         = '#A7C080',

  gray          = '#F43E5C',
  darkgray      = '#303030', --'#1A1C23',
  lightgray     = '#6E505E',
  highlightgray = '#7C6F93',
  inactivegray  = '#1C1E26',
  dest          = '#101015', -- '#1c1e26', --'#393d38',
  dest_fg       = '#808080'

}

local function rcolor(color)
  local hex_num = color.sub(color, 2)
  local rcolor_dec = 16777215 - tonumber(hex_num, 16)
  return string.format('#%06X', rcolor_dec)
end

local function ctrans(from, to, level)
  local smoothness = 21
  level = level + smoothness - 6
  local r = (smoothness - level) * tonumber(from.sub(from, 2, 3), 16) / smoothness +
  level * tonumber(to.sub(to, 2, 3), 16) / smoothness
  local g = (smoothness - level) * tonumber(from.sub(from, 4, 5), 16) / smoothness +
  level * tonumber(to.sub(to, 4, 5), 16) / smoothness
  local b = (smoothness - level) * tonumber(from.sub(from, 6, 7), 16) / smoothness +
  level * tonumber(to.sub(to, 6, 7), 16) / smoothness
  return string.format('#%02X%02X%02X', r, g, b)
end

local function lighting(c)
  local ratio = 5
  local r = (ratio - 1) * tonumber(c.sub(c, 2, 3), 16) / ratio
  local g = (ratio - 1) * tonumber(c.sub(c, 4, 5), 16) / ratio
  local b = (ratio - 1) * tonumber(c.sub(c, 6, 7), 16) / ratio
  return string.format('#%02X%02X%02X', r, g, b)
end

local normal_bg = colors.grass
local insert_bg = colors.blue
local visual_bg = colors.purple
local replace_bg = colors.yellow
local command_bg = colors.green
local terminal_bg = colors.cyan


return {
  normal = {
    a = { bg = normal_bg, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(normal_bg, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(normal_bg, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(normal_bg, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(normal_bg, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = lighting(normal_bg), fg = colors.black }
  },
  insert = {
    a = { bg = insert_bg, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(insert_bg, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(insert_bg, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(insert_bg, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(insert_bg, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = insert_bg, fg = colors.black }
  },
  visual = {
    a = { bg = visual_bg, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(visual_bg, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(visual_bg, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(visual_bg, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(visual_bg, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = visual_bg, fg = colors.black }
  },
  replace = {
    a = { bg = replace_bg, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(replace_bg, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(replace_bg, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(replace_bg, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(replace_bg, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = replace_bg, fg = colors.black }
  },
  command = {
    a = { bg = command_bg, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(command_bg, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(command_bg, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(command_bg, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(command_bg, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = command_bg, fg = colors.black }
  },
  terminal = {
    a = { bg = terminal_bg, fg = colors.black, gui = 'bold' },
    b = { bg = ctrans(terminal_bg, colors.dest, 2), fg = colors.dest_fg },
    c = { bg = ctrans(terminal_bg, colors.dest, 3), fg = colors.dest_fg },
    x = { bg = ctrans(terminal_bg, colors.dest, 3), fg = colors.dest_fg },
    y = { bg = ctrans(terminal_bg, colors.dest, 4), fg = colors.dest_fg },
    z = { bg = terminal_bg, fg = colors.black }
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
