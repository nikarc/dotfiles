return {
  { "EdenEast/nightfox.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      local util_colors = require("nikarc.utils").git_colors
      local color = vim.api.nvim_get_hl_by_name("Debug", true)
      local border_color = string.format("%06x", color.foreground)

      return {
        style = "storm",
        transparent = true,
        -- hide_inactive_statusline = true,
        on_colors = function (colors)
          -- print(vim.inspect(colors))
        end,
        on_highlights = function(hl, colors)
          hl.GitSignsAdd = {
            fg = util_colors.GitAdd,
          }
          hl.GitSignsChange = {
            fg = util_colors.GitChange,
          }
          hl.GitSignsDelete = {
            fg = util_colors.GitDelete,
          }
          hl.WinSeparator = {
            fg = colors.border_highlight,
          }
          hl.LineNr = {
            fg = colors.blue
          }
          hl.LineNrAbove = {
            fg = '#505A84'
          }
          hl.LineNrBelow = {
            fg = '#505A84'
          }
          hl.DiagnosticUnnecessary = {
            fg = colors.comment
          }
        end,
      }
    end,
    config = function(_, opts)
      local tokyonight = require("tokyonight")
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function ()
  --     require("catppuccin").setup {
  --       flavour = "macchiato"
  --     }
  --
  --     vim.cmd.colorscheme("catppuccin")
  --   end
  -- },
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     require("everforest").setup()
  --
  --     -- vim.cmd([[colorscheme everforest]])
  --   end,
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function ()
  --     vim.cmd([[colorscheme kanagawa]])
  --   end
  -- },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   config = function ()
  --     vim.opt.background = "dark"
  --     vim.cmd.colorscheme "oxocarbon"
  --   end
  -- }
}
