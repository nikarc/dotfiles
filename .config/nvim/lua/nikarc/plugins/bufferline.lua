local utils = require('nikarc.utils')

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      highlights = {
        background = {
          fg = utils.get_hl_color('Conceal'),
          -- bg = '<colour-value-here>',
        },
        buffer_selected = {
          fg = utils.get_hl_color('Identifier'),
        },
        buffer_visible = {
          fg = utils.get_hl_color('Special'),
        },
      }
    })
  end
}
