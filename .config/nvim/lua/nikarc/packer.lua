-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use "nvim-lua/plenary.nvim"

  -- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- END Telescope

  -- colorschemes
	use({
		'rose-pine/neovim',
		as = 'rose-pine'
	})
  use 'arcticicestudio/nord-vim'
  use {'nyoom-engineering/oxocarbon.nvim'}
  use "EdenEast/nightfox.nvim"
  -- END colorschemes

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

  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

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

  use {
    'ckolkey/ts-node-action',
    requires = { 'nvim-treesitter' },
    config = function ()
      require('ts-node-action').setup({})
    end
  }

  use 'folke/which-key.nvim'

  -- session management
  use {
    'Shatur/neovim-session-manager',
    config = function()
      require('session_manager').setup({})
    end
  }

  use 'stevearc/dressing.nvim'

  use {
    'akinsho/toggleterm.nvim',
    tag = '*'
  }

  use 'norcalli/nvim-colorizer.lua'

  use {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = vim.defer_fn(function()
      require("copilot").setup({
        suggestion = false,
        panel = false,
      })
    end, 100),
  }

  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function ()
  --     require("copilot_cmp").setup {
  --       method = "getCompletionsCycling",
  --       formatters = {
  --         label = require("copilot_cmp.format").format_label_text,
  --         insert_text = require("copilot_cmp.format").format_insert_text,
  --         preview = require("copilot_cmp.format").deindent,
  --       },
  --     }
  --   end
  -- }

  use 'lewis6991/gitsigns.nvim'

  use 'wfxr/minimap.vim'

  -- use 'mrjones2014/nvim-ts-rainbow'

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

	-- Non-lua packages
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-surround'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-commentary'
end)
