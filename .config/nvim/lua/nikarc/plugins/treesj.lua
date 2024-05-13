return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  -- enabled = false,
  config = function()
    require('treesj').setup({--[[ your config ]]})

    vim.keymap.set("n", "<Space>{", require('treesj').toggle)
  end,
}
