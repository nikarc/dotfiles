vim.api.nvim_create_user_command(
  'BuffClose',
  function ()
    if pcall(vim.cmd('b#')) then
      vim.cmd('b#')
    else
      vim.cmd('bp')
    end

    vim.cmd('bw#')
  end,
  { nargs = 0 }
)
