return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  -- enabled = false,
  config = function()
    require('treesj').setup({--[[ your config ]]})

    vim.keymap.set("n", "<Space>k", require('treesj').toggle)
  end,
}
