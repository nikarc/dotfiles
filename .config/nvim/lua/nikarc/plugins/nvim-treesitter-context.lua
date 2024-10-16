return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = false,
  config = function()
    require('treesitter-context').setup {
      context = {
        enable = true,
        throttle = true,
        max_lines = 1,
      },
    }
  end,
}
