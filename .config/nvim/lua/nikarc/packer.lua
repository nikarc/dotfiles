-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use "nvim-lua/plenary.nvim"

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
		'rose-pine/neovim',
		as = 'rose-pine'
	})
  use 'arcticicestudio/nord-vim'

	-- treesitter
	use(
		'nvim-treesitter/nvim-treesitter',
		{
			run = ':TSUpdate'
		}
	)
	use 'nvim-treesitter/playground'
	-- END treesitter

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use 'theprimeagen/harpoon'

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  use {
      'jose-elias-alvarez/null-ls.nvim',
      requires = 'nvim-lua/plenary.nvim'
  }

  use '0oAstro/dim.lua'

  use 'echasnovski/mini.indentscope'

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  -- session management
  use 'Shatur/neovim-session-manager'

  use 'stevearc/dressing.nvim'

  use {
    'akinsho/toggleterm.nvim',
    tag = '*'
  }

  use 'norcalli/nvim-colorizer.lua'

	-- Non-lua packages
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-commentary'
end)
