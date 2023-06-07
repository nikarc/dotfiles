local ensure_installed = {
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
}

local function filterReactDTS(value)
    return string.match(value.filename, 'react/index.d.ts') == nil and
      string.match(value.filename, 'styled-components/index.d.ts') == nil
end

local function filter(arr, fn)
  if type(arr) ~= "table" then
      return arr
    end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
        table.insert(filtered, v)
    end
  end

  return filtered
end

local function on_list(options)
  -- [https://github.com/typescript-language-server/typescript-language-server/issues/216](https://github.com/typescript-language-server/typescript-language-server/issues/216)
  local items = options.items
  if #items > 1 then
    items = filter(items, filterReactDTS)
  end

  vim.fn.setqflist({}, ' ', {
    title = options.title,
    items = items,
    context = options.context
  })
  vim.api.nvim_command('cfirst')
end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local opts = {remap = false}
    vim.keymap.set(
      'n',
      'gd',
      function() vim.lsp.buf.definition({on_list=on_list}) end,
      opts
    )
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  end
})

local function lspSymbol(name, icon)
  vim.fn.sign_define(
    'DiagnosticSign' .. name,
    { text = icon, numhl = 'DiagnosticDefault' .. name }
  )
end

lspSymbol('Error', '🔥')
lspSymbol('Info', 'ℹ️')
lspSymbol('Hint', '💡')
lspSymbol('Info', '💡')
lspSymbol('Warn', '⚠️')

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = ensure_installed,
})

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
    })
  end,
})


------------------------
-- Autocomplete
------------------------
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 1},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
})

-- local lsp = require('lsp-zero')

-- lsp.preset('recommended')

-- lsp.ensure_installed({
--   'tsserver',
--   'eslint',
--   'lua_ls',
--   'rust_analyzer',
-- })

-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['[c'] = cmp.mapping.select_prev_item(cmp_select),
--   [']c'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ['<C-Space>'] = cmp.mapping.complete(),
--   -- ['<C-j>'] = cmp.mapping(function(fallback)
--   --     cmp.mapping.abort()
--   --     local copilot_keys = vim.fn["copilot#Accept"]()

--   --     if copilot_keys ~= "" then
--   --       vim.api.nvim_feedkeys(copilot_keys, "i", true)
--   --     else
--   --       fallback()
--   --     end
--   -- end)
-- })

-- lsp.set_preferences({
--   sign_icons = {
--     hint = '💡',
--     warn = '⚠️',
--     error = '🔥',
--     info = '',
--   }
-- })

-- lsp.setup_nvim_cmp({
--   mapping =  cmp_mappings,
--   sources = {
--     {name = 'path', keyword_length = 3},
--     {name = 'nvim_lsp', keyword_length = 3},
--     {name = "copilot", keyword_length = 3},
--     {name = 'buffer', keyword_length = 3},
--     {name = 'luasnip', keyword_length = 2},
--   }
-- })

-- local function filter(arr, fn)
--   if type(arr) ~= "table" then
--       return arr
--     end

--   local filtered = {}
--   for k, v in pairs(arr) do
--     if fn(v, k, arr) then
--         table.insert(filtered, v)
--     end
--   end

--   return filtered
-- end

-- local function filterReactDTS(value)
--     return string.match(value.filename, 'react/index.d.ts') == nil and
--       string.match(value.filename, 'styled-components/index.d.ts') == nil
-- end

-- local function on_list(options)
--     -- [https://github.com/typescript-language-server/typescript-language-server/issues/216](https://github.com/typescript-language-server/typescript-language-server/issues/216)
--     local items = options.items
--     if #items > 1 then
--         items = filter(items, filterReactDTS)
--     end

--     vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
--     vim.api.nvim_command('cfirst')
-- end

-- lsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}

--   vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition({on_list=on_list}) end, opts)
--   -- vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts) -- See lspsaga.lua
--   vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
--   vim.keymap.set('n', '<Space>e', function() vim.diagnostic.open_float() end, opts)
--   vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
--   vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
--   vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
--   vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
--   vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
-- end)

-- lsp.setup()
