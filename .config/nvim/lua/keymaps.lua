-- require'mapx'.setup{global = true}
-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

-- Add ; to end of line
-- nnoremap <silent> ,; A;<Esc>
map('n', ',;', 'A;<Esc>', { noremap = true, silent = true })

-- Add , to end of line
-- nnoremap <silent> ,, A,<Esc>
map('n', ',,', 'A,<Esc>', { noremap = true, silent = true })

-- Buffer stuff
-- map('n', 'bn', ':bn<CR>', { noremap = true, silent = true })
-- map('n', 'bb', ':bp<CR>', { noremap = true, silent = true })
map('n', 'bw', ':bp | bw#<CR>', { noremap = true, silent = true })
--------------------
-- Bufferline
--------------------
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', 'bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', 'bb', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', '[b', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
map('n', 'b]', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })

-- These commands will sort buffers by directory, language, or a custom criteria
map('n', 'be', ':BufferLineSortByExtension<CR>', { noremap = true, silent = true })
map('n', 'bd', ':BufferLineSortByDirectory<CR>', { noremap = true, silent = true })
-- Custom sort method:
-- nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

-- don't use arrow keys
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('i', '<leader>s', '<C-c>:w<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':quitall<CR>', default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- open terminal
map('n', '<C-t>', ':CreateTerminalInstance<CR>', {noremap = true})
-- Exit terminal mode
map('t', '<C-t>', '<C-\\><C-n>', {noremap = true})

-- nvim-tree
-- map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
-- map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
-- map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Vista tag-viewer
map('n', '<C-m>', ':Vista!!<CR>', default_opts)   -- open/close

-- Telescope
map('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<C-b>', ':Telescope buffers<CR>', { noremap = true, silent = true })
map('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-----------------------------------------------------------
-- Simple tag expansion
-----------------------------------------------------------
-- mapx.group('slient', { ft = {
--   'javascriptreact',
--   'typescriptreact'
-- }}, function()
--   inoremap('<C-y>t', 'vBx')
-- end)

-- Renamer
vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

-----------------------------------------------------------
-- sideways.vim https://github.com/AndrewRadev/sideways.vim
-----------------------------------------------------------
map('n', '<C-<>', ':SidewaysLeft<CR>', { noremap = true, silent = true })
