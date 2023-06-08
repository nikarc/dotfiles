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
  use 'nvim-telescope/telescope-fzy-native.nvim'
  -- END Telescope

  -- colorschemes
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine'
  -- })
  use 'arcticicestudio/nord-vim'
  use {'nyoom-engineering/oxocarbon.nvim'}
  use "EdenEast/nightfox.nvim"
  use {
    'AlexvZyl/nordic.nvim',
    as = 'nordic'
  }
  use {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup({
        on_colors = function(colors)
          colors.border = '#be98fd'
        end
      })
    end
  }
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

  -- LSP
  -- use {
  --   'VonHeikemen/lsp-zero.nvim',
  --   requires = {
  --     -- LSP Support
  --     {'neovim/nvim-lspconfig'},
  --     {'williamboman/mason.nvim'},
  --     {'williamboman/mason-lspconfig.nvim'},

  --     -- Autocompletion
  --     {'hrsh7th/nvim-cmp'},
  --     {'hrsh7th/cmp-buffer'},
  --     {'hrsh7th/cmp-path'},
  --     {'saadparwaiz1/cmp_luasnip'},
  --     {'hrsh7th/cmp-nvim-lsp'},
  --     {'hrsh7th/cmp-nvim-lua'},

  --     -- Snippets
  --     {'L3MON4D3/LuaSnip'},
  --     {'rafamadriz/friendly-snippets'},
  --   }
  -- }
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  -- END LSP

  -- use 'theprimeagen/harpoon'

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

  -- Copilot

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        -- panel = {
        --   enabled = false,
        -- },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-Enter>",
          }
        },
      })
    end,
  }

  -- END Copilot

  use 'lewis6991/gitsigns.nvim'

  -- use {
  --   'wfxr/minimap.vim',
  --   config = function()
  --     vim.g.minimap_width = 10
  --     vim.g.minimap_auto_start = 1
  --     vim.g.minimap_auto_start_win_enter = 1
  --   end
  -- }

  -- use 'mrjones2014/nvim-ts-rainbow'

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use({
    "jackMort/pommodoro-clock.nvim",
      config = function()
          require("pommodoro-clock").setup({
        -- optional configuration
      })
        end,
      requires = {
        "MunifTanjim/nui.nvim",
      }
  })

  use({
    'Wansmer/sibling-swap.nvim',
    requires = { 'nvim-treesitter' },
    config = function()
      require('sibling-swap').setup({
        use_default_keymaps = true,
      })
    end,
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use {
    "jcdickinson/wpm.nvim",
    config = function()
      require("wpm").setup({})
    end
  }

  use {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup()
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end
  }

  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end
  }

  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  })

  -- Non-lua packages
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-commentary'
end)
