--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


Neovim init file
Version: 0.10.0 - 2021/10/26
Maintainer: Brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('settings') -- settings
require('keymaps') -- keymaps

require('plugins/packer') -- plugin manager
require('plugins/feline') -- statusline
require('plugins/nvim-cmp') -- autocomplete
require('plugins/null-ls')
require('plugins/nvim-autopairs') -- autopairs
require('plugins/nvim-lspconfig') -- LSP settings
require('plugins/vista') -- tag viewer
require('plugins/nvim-treesitter') -- tree-sitter interface
require('plugins/alpha-nvim') -- Start page plugin
require('plugins/bufferline-nvim') -- Buffer tabs
require('plugins/searchbox-nvim') -- Styled search box
require('plugins/lua-dev')
require('plugins/renamer')
require('plugins/telescope-nvim')
