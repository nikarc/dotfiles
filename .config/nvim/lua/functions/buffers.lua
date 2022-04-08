vim.api.nvim_add_user_command(
  'CloseBufferAndReturn',
  function()
    if vim.api.nvim_buf_is_valid('b#') then
      vim.cmd('b#')
    else
      vim.cmd('bp')
    end

    vim.cmd('bw#')
  end,
  { nargs = 0 }
)
