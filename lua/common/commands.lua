-- my_command.lua

local saved = nil

local function validate_bufnr(bufnr)
  if bufnr == -1 then
    return 0
  end
  return bufnr
end

vim.api.nvim_create_user_command(
  "Config",
  function(arg)
    --- @type string
    local configpath = vim.fn.stdpath('config');  --- @diagnostic disable-line
    local configfile = vim.fs.joinpath(configpath, "init.lua");
    if #arg.fargs == 0 then
      saved = {
        prev = saved,
        dir = vim.fn.getcwd(),
        bufnr = validate_bufnr(vim.fn.bufnr(0))
      }
      vim.cmd.edit(configfile)
      vim.api.nvim_set_current_dir(configpath);
    elseif arg.fargs[1] == 'finish' then
      if not saved then
        vim.notify("you are not editing config", vim.log.levels.ERROR);
        return
      end
      vim.api.nvim_set_current_buf(saved.bufnr)
      vim.api.nvim_set_current_dir(saved.dir)
      saved = saved.prev
    else
      vim.notify("unknown option: " .. arg.fargs[1], vim.log.levels.ERROR);
    end
  end,
  { nargs = '?' }
)
