local api = vim.api
local keymap = api.nvim_set_keymap

-- Clear search highlight
--nnoremap <silent> <Esc> :noh<CR><Esc>
keymap('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

-- Add ; to end of line
-- nnoremap <silent> ,; A;<Esc>
keymap('n', ',;', 'A;<Esc>', { noremap = true, silent = true })

-- Add , to end of line
-- nnoremap <silent> ,, A,<Esc>
keymap('n', ',,', 'A,<Esc>', { noremap = true, silent = true })

-- Buffer stuff
-- nnoremap <silent> bn :bn<CR>
-- nnoremap <silent> bb :bp<CR>
-- nnoremap <silent> bo :%bd\|e#<CR> <- Dunno what this does?
-- nnoremap <silent> bd :bwipeout<CR>
keymap('n', 'bn', ':bn<CR>', { noremap = true, silent = true })
keymap('n', 'bb', ':bp<CR>', { noremap = true, silent = true })
keymap('n', 'bd', ':bwipeout<CR>', { noremap = true, silent = true })

-- Telescope
-- nnoremap <silent> <C-p> :Telescope find_files<cr>
-- nnoremap <silent> <C-b> :Telescope buffers<cr>
-- nnoremap <leader>fg :Telescope live_grep<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
keymap('n', '<C-b>', ':Telescope buffers<CR>', { noremap = true, silent = true })
keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
