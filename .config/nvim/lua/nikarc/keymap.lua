local map = vim.keymap.set

map('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

-- In visual mode, move entire line up or down
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '>-2<CR>gv=gv")

-- J appends the line below to the current line. This mapping keeps your cursor
-- in the same location, instead of jumping to the start of the line
map('n', 'J', 'mzJ`z')

-- When half-page scrolling, keep cursor in same column
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- When jumping between search terms, keep cursor in middle
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Paste without yanking underneath
map('x', '<leader>p', '"_dP')

-- Serach and replace using the current cursor word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable
map('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- Shortcuts to add comma/semicolon
map('n', ',,', 'A,<Esc>')
map('n', ',;', 'A;<Esc>')

map('n', 'bb', vim.cmd.bp)
map('n', 'bn', vim.cmd.bn)
map('n', 'bw', vim.cmd.bw)
