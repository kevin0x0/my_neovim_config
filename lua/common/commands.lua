-- my_command.lua

vim.api.nvim_command([[
  command! MyConfig :execute("e " .. stdpath('config') .. "/init.lua")
]])
