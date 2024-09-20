return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('oil').setup({
      default_file_explorer = false,
      keymaps = {
        ["<C-p>"] = nil,
      }
    })

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Open parent directory in oil" })
  end,
}
