vim.api.nvim_set_keymap(
  'n',
  '<leader>s',
  '<cmd>lua require("searchbox").incsearch()<CR>',
  {noremap = true}
)
