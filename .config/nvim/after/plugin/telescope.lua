local telescope = require('telescope')
local builtin = require('telescope.builtin')
local fb_actions = require "telescope".extensions.file_browser.actions

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<space>fb', ':Telescope file_browser<CR>', {noremap = true})

telescope.setup({
  extensions = {
    file_browser = {
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-c>'] = fb_actions.create
        }
      }
    }
  }
})

telescope.load_extension('file_browser')
