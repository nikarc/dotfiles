-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim


local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Automatically :PackerCompile when saving this file
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

-- Bootstrap Packer.nvim if not installed
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

-- Add packages
-- for packages info see: init.lua (Lua modules)
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- use 'kyazdani42/nvim-tree.lua'
  -- use 'Yggdroot/indentLine'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  use 'liuchengxu/vista.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use { 'tzachar/cmp-tabnine',
    run = './install.sh',
    requires = 'hrsh7th/nvim-cmp'
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use { 'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use { 'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons' }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end }
  use "b0o/mapx.nvim"
  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- use {
  --   'romgrk/nvim-treesitter-context',
  --   requires = 'nvim-treesitter/nvim-treesitter'
  -- }
  use {
    'VonHeikemen/searchbox.nvim',
    requires = {
      { 'MunifTanjim/nui.nvim' }
    }
  }
  use "folke/lua-dev.nvim"
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  }
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v1.*'
  }

  use 'tpope/vim-eunuch'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'mattn/emmet-vim'
  use 'tpope/vim-fugitive'
  use 'lambdalisue/suda.vim'
  use {
    'heavenshell/vim-jsdoc',
    run = 'make install'
  }
  use 'onsails/lspkind.nvim'

  -- color schemes
  -- use 'bluz71/vim-nightfly-guicolors'
  -- use 'tanvirtin/monokai.nvim'
  use 'folke/tokyonight.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
