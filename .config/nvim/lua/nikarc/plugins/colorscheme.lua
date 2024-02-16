return {
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      local colors = require("nikarc.utils").git_colors
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          local color = vim.api.nvim_get_hl_by_name("Debug", true)
          local border_color = string.format("%06x", color.foreground)
          vim.api.nvim_set_hl(0, 'WinSeparator', {fg = '#'..border_color})
        end,
      })
      return {
        style = "night",
        transparent = true,
        -- hide_inactive_statusline = true,
        on_highlights = function(hl, c)
          hl.GitSignsAdd = {
            fg = colors.GitAdd,
          }
          hl.GitSignsChange = {
            fg = colors.GitChange,
          }
          hl.GitSignsDelete = {
            fg = colors.GitDelete,
          }
        end,
      }
    end,
    config = function(_, opts)
      local tokyonight = require("tokyonight")
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  }
}
