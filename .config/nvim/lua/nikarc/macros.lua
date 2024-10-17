vim.api.nvim_create_user_command('FormatBuffer', function()
  -- Save the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  -- Format the entire buffer
  vim.cmd('normal! gg=G')

  -- Return to the original cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)

  vim.cmd('normal! zz')
end, {})
