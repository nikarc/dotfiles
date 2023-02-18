local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['[c'] = cmp.mapping.select_prev_item(cmp_select),
  [']c'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
  -- ['<C-j>'] = cmp.mapping(function(fallback)
  --     cmp.mapping.abort()
  --     local copilot_keys = vim.fn["copilot#Accept"]()

  --     if copilot_keys ~= "" then
  --       vim.api.nvim_feedkeys(copilot_keys, "i", true)
  --     else
  --       fallback()
  --     end
  -- end)
})

lsp.set_preferences({
  sign_icons = {
    hint = '💡',
    warn = '⚠️',
    error = '🔥',
    info = '',
  }
})

lsp.setup_nvim_cmp({
  mapping =  cmp_mappings,
  sources = {
    {name = 'path', keyword_length = 3},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = "copilot", keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', '<Space>e', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()
