-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function()
    -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Utilities
  use 'tpope/vim-eunuch'
  use 'tpope/vim-surround'
  use 'airblade/vim-gitgutter'
  use 'windwp/nvim-autopairs'
  use "lukas-reineke/cmp-rg"
  use 'mattn/emmet-vim'
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'tpope/vim-commentary'

  -- Autocompletion/LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use "hrsh7th/nvim-cmp"

  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  -- end Autocompletion/LSP

  -- UI
  use 'vim-airline/vim-airline'
  use 'norcalli/nvim-colorizer.lua'

  -- Colorschemes
  use {
    'bluz71/vim-nightfly-guicolors',
    config = function()
      vim.api.nvim_command('colorscheme nightfly')
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
