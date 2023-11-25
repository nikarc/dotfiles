return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
  },
  opts = function ()
    local cmp = require"cmp"
    local luasnip = require"luasnip"

    require('luasnip.loaders.from_vscode').lazy_load()

    return {
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function (args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = {
        {name = 'path'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'nvim_lsp', keyword_length = 1},
        {name = 'buffer', keyword_length = 3},
      }
    }
  end
}
