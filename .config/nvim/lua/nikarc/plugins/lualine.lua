return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    opt = true,
  },
  config = function()
    -- local wpm = require('wpm')
    local bubbles_theme = require("nightfox.util.lualine")("nightfox")

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
            icon = "",
            color = { fg = "DarkCyan", gui = "bold" },
          },
          -- wpm.historic_graph
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
  end
}
