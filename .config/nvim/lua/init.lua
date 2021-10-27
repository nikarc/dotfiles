-- aliases
local o  = vim.o     -- global
local g  = vim.g     -- global for let options
local wo = vim.wo    -- window local
local bo = vim.bo    -- buffer local
local fn = vim.fn    -- access vim functions
local cmd = vim.cmd  -- vim commands

o.number = true
o.relativenumber = true
o.wrap = true
o.cursorline = true
o.clipboard = o.clipboard.."unnamedplus"
o.ignorecase = true
o.smartcase = true
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true
o.termguicolors = true
o.completeopt = 'menu,menuone,noselect'
o.backupdir = vim.fn.stdpath('config') .. '/.vim/backup//'
o.directory = vim.fn.stdpath('config') .. '/.vim/swap//'
o.undodir = vim.fn.stdpath('config') .. '/.vim/undo//'
o.undofile = true

-- Vim Airline Buffer Tabs
g["airline#extensions#tabline#enabled"] = 1
