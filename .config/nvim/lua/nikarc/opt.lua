local cmd 		    = vim.cmd
local opt 		    = vim.opt
local exec 		    = vim.api.nvim_exec
-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true -- enable 24-bit RGB colors

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.g.mapleader     = '<Space>'
opt.mouse 		      = ''
opt.clipboard 		  = 'unnamedplus'

-- Send swap/undo files to somewhere else on the filesystem.
-- This avoids having to .gitignore these files in repos
opt.swapfile 		    = false
opt.backup          = false
opt.undodir   		  = os.getenv('HOME') .. '/.vim/undo//'
opt.undofile  		  = true -- Allow unlimited undo

vim.g.node_host_prog = '~/n/n/versions/node/19.5.0/bin/node'

-----------------------------------------------------------
-- Indentation
-----------------------------------------------------------
opt.tabstop 		    = 2
opt.softtabstop 	  = 2
opt.shiftwidth 		  = 2
opt.expandtab 	    = true
opt.smartindent     = true

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number 		      = true
opt.relativenumber	= true
opt.showmatch      	= true -- highlight matching parenthesis
-- opt.foldmethod     	= 'none' -- enable folding (default 'foldmarker')
-- opt.foldmethod      = 'manual'
opt.colorcolumn    	= '80' -- line lenght marker at 80 columns
opt.splitright     	= true -- vertical split to the right
opt.splitbelow     	= true -- horizontal split to the bottom
opt.ignorecase     	= true -- ignore case letters when search
opt.smartcase      	= true -- ignore lowercase for the whole pattern
opt.linebreak      	= true -- wrap on word boundary
opt.wrap            = true
opt.laststatus     	= 3 -- Global status line
opt.scrolloff       = 5 -- Guarantee at least 8 lines above/below cursor when scrolling
opt.guicursor       = {
    "n-v:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "i-c-ci-ve:ver25",
    "r-cr:hor20",
    "o:hor50",
    "i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- opt.fillchars = {
--   horiz     = '━',
--   horizup   = '┻',
--   horizdown = '┳',
--   vert      = '┃',
--   vertleft  = '┫',
--   vertright = '┣',
--   verthoriz = '╋',
-- }

local hl_group = "DiagnosticWarn"
local hl_details = vim.api.nvim_get_hl_by_name(hl_group, true)
-- vim.api.nvim_get_hl_by_name("DiagnosticWarn", true)

-- print(vim.inspect(color))


-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- don't auto comment new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)
