local telescope = require('telescope')
local builtin = require('telescope.builtin')
local fb_actions = require "telescope".extensions.file_browser.actions
local utils = require('nikarc.utils')

telescope.load_extension('file_browser')
telescope.load_extension('fzy_native')

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<Space>o', builtin.resume, {})
vim.keymap.set(
  'n',
  '<space>fb',
  ':Telescope file_browser<CR>',
  {noremap = true}
)

telescope.setup({
  defaults = {
    borderchars = {
      prompt = { '▔', '▕', ' ', '▏', '🭽', '🭾', '▕', '▏' },
      results = utils.border_chars_outer_thin_telescope,
      preview = utils.border_chars_outer_thin_telescope,
      cache_picker = {
        num_pickers = 1,
        limit_entries = 1000,
      }
    },
    path_display = {
      'smart'
    },
    layout_config = {
      horizontal = {
        width = 0.9,
        preview_width = 80
      }
    }
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-c>'] = fb_actions.create
        }
      }
    },
    project = {
      base_dirs = {
        '~/Work',
        '~/Personal',
        '~/dotfiles'
      }
    }
  },
})
