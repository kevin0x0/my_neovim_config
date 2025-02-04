-- my_command.lua

vim.api.nvim_create_user_command(
  "MyConfig",
  function(arg)
    --- @type string
    local configpath = vim.fn.stdpath('config');  --- @diagnostic disable-line
    local configfile = vim.fs.joinpath(configpath, "init.lua");
    if arg.args == 'edit' then
      vim.cmd.edit(configfile)
      vim.api.nvim_set_current_dir(configpath);
    elseif arg.args == 'view' then
      vim.cmd.edit(configfile)
    else
      vim.notify("unknown option: " .. arg.args, vim.log.levels.ERROR);
    end
  end,
  { nargs = 1 }
)
