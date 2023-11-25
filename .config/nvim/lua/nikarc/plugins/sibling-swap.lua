return {
  'Wansmer/sibling-swap.nvim',
  dependencies = { 'nvim-treesitter' },
  config = function()
    require('sibling-swap').setup({
      use_default_keymaps = true,
    })
  end,
}
