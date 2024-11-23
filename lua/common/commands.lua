-- my_command.lua

vim.api.nvim_create_user_command(
  "MyConfig",
  function(arg)
    --- @type string
    local configpath = vim.fn.stdpath('config');  --- @diagnostic disable-line
    local command = ":e " .. vim.fs.joinpath(configpath, "init.lua");
    if arg.args == 'edit' then
      vim.api.nvim_command(command);
      vim.api.nvim_set_current_dir(configpath);
    elseif arg.args == 'view' then
      vim.api.nvim_command(command);
    else
      vim.notify("unknown option: " .. arg.args, vim.log.levels.ERROR);
    end
  end,
  { nargs = 1 }
)

vim.api.nvim_create_user_command(
  "MyQuerySync",
  function(_)
    local url = "https://raw.githubusercontent.com/kevin0x0/tree-sitter-klang/main/queries/highlights.scm"
    local outputpath = vim.fn.stdpath('config') .. "/queries/klang/highlights.scm"
    local success = os.execute("wget " .. url .. " -O " .. outputpath)
    if success then
      vim.notify("download successfully", vim.log.levels.INFO)
    else
      error("failed to download query file from " .. url)
    end
  end,
  {}
)
