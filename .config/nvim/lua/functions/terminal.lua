vim.api.nvim_create_user_command(
  'CreateTerminalInstance',
  function ()
    vim.cmd('vertical split')
    vim.cmd('vertical resize -30')
    vim.cmd('terminal')
    vim.cmd('setlocal nobuflisted')
  end,
  { nargs = 0 }
)
