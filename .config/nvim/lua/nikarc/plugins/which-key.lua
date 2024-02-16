return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  enabled = false,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}
