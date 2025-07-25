return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup(function()
      vim.keymap.set('n', '<leader>aa', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })
    end)
  end
}
