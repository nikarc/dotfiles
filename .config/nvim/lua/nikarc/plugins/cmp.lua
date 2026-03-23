local kind_icons = require("nikarc.utils").kind_icons

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- "L3MON4D3/LuaSnip",
    -- "saadparwaiz1/cmp_luasnip",
    -- "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind.nvim",
  },
  opts = function ()
    local cmp = require"cmp"
    -- local luasnip = require"luasnip"
    local lspkind = require"lspkind"

    -- require('luasnip.loaders.from_vscode').lazy_load()

    return {
      sorting = {
        priority_weight = 2,
        comparators = {
          -- Custom comparator to prioritize EnumMembers
          function(entry1, entry2)
            local kind1 = entry1:get_kind()
            local kind2 = entry2:get_kind()

            if kind1 == cmp.lsp.CompletionItemKind.EnumMember and kind2 ~= cmp.lsp.CompletionItemKind.EnumMember then
              return true
            elseif kind2 == cmp.lsp.CompletionItemKind.EnumMember and kind1 ~= cmp.lsp.CompletionItemKind.EnumMember then
              return false
            end
          end,
          -- The built-in comparators
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      -- snippet = {
      --   expand = function (args)
      --     luasnip.lsp_expand(args.body)
      --   end,
      -- },
      formatting = {
        -- format = lspkind.cmp_format({
        --   before = require("tailwind-tools.cmp").lspkind_format,
        -- }),
        format = lspkind.cmp_format(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = {
        {name = 'path'},
        -- {name = 'luasnip', keyword_length = 2},
        {name = 'nvim_lsp', keyword_length = 1},
        {name = 'buffer', keyword_length = 3},
      }
    }
  end
}
