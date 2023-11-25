local utils = require('nikarc.utils')

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<CR>"},
    { "<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>"},
    { "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<CR>"},
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  },
  opts = function ()
    return {
      defaults = {
        borderchars = {
          prompt = { '▔', '▕', ' ', '▏', '🭽', '🭾', '▕', '▏' },
          results = utils.border_chars_outer_thin_telescope,
          preview = utils.border_chars_outer_thin_telescope,
        },
        path_display = {
          'smart'
        },
        layout_config = {
          horizontal = {
            width = 0.9,
            preview_width = 50
          }
        }
      },
    }
  end
}
