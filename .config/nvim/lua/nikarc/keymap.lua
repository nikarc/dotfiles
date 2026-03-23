local map = vim.keymap.set

local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<Esc>', ':noh<CR><Esc>', opts)

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
map('x', '<Space>p', '"_dP')

-- Serach and replace using the current cursor word
map("n", "<Space>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable
map('n', '<Space>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- Shortcuts to add comma/semicolon
map('n', ',,', 'A,<Esc>')
map('n', ',;', 'A;<Esc>')

map('n', 'bb', vim.cmd.bp)
map('n', 'bn', vim.cmd.bn)
map('n', 'bw', vim.cmd.bw)

-- Sessions
map('n', '<Space>pp', '<cmd>SessionManager load_session<CR>')
map('n', '<Space>ps', '<cmd>SessionManager save_current_session<CR>')

-- Neotree
-- map('n', '<Space>b', '<cmd>Neotree reveal<CR>')

-- Copy filename to clipboard
vim.api.nvim_create_user_command("CopyRelPath", "call setreg('+', fnamemodify(expand('%'), ':.'))", {})
map('n', '<Space>cf', '<cmd>CopyRelPath<CR>', { noremap = true, silent = true })

-- Git
map('n', '<Space>gs', '<cmd>Git<CR>')
map('n', '<Space>gb', '<cmd>Git blame_line<CR>')

-- Manually call lsp formatter
map('n', '<Space>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

-- Kill all buffers
map('n', '<Space>kb', '<cmd>%bw<CR>', opts)

-- Macros
map('n', '<Leader>fb', ':FormatBuffer<CR>', opts)
map('n', '<leader>cr', ':source $MYVIMRC<CR>', { desc = 'Reload config' })

-- Neo Minimap
map('n', '<Space>mm', '<cmd>Neominimap toggle<CR>', opts)
