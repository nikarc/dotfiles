-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

local wpm = require('wpm')

-- stylua: ignore
-- local colors = {
--   blue   = '#80a0ff',
--   cyan   = '#79dac8',
--   black  = '#080808',
--   white  = '#c6c6c6',
--   red    = '#ff5189',
--   violet = '#d183e8',
--   grey   = '#303030',
-- }

local bubbles_theme = require("nightfox.util.lualine")("nightfox")
-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.black, bg = colors.violet },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.black, bg = colors.cyan },
--   },

--   insert = { a = { fg = colors.black, bg = colors.blue } },
--   visual = { a = { fg = colors.black, bg = colors.cyan } },
--   replace = { a = { fg = colors.black, bg = colors.red } },

--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.black, bg = colors.black },
--   },
-- }

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = {
      {
        'filename',
        path = 1
      },
      'branch'
    },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = {
      'filetype',
      'progress',
      -- wpm.wpm,
      -- Display number of loaded buffers
      {
        function()
          local is_loaded = vim.api.nvim_buf_is_loaded
          local tbl = vim.api.nvim_list_bufs()
          local loaded_bufs = 0
          for i = 1, #tbl do
            if is_loaded(tbl[i]) then
              loaded_bufs = loaded_bufs + 1
            end
          end
          return loaded_bufs
        end,
        icon = "﬘",
        color = { fg = "DarkCyan", gui = "bold" },
      },
      wpm.historic_graph
    },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}


