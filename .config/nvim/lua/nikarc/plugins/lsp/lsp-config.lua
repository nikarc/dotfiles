local lsp_signs = require("nikarc.utils").lsp_signs
local lsp_servers = require("nikarc.utils").lsp_servers

return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "antosha417/nvim-lsp-file-operations",
      config = true,
    }
  },
  config = function ()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

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

    local on_attach = function (_, bufnr)
      local opts = { noremap = true, silent = true }
      opts.buffer = bufnr

      -- Keymaps
      opts.desc = "Go to Definition"
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition({on_list=on_list}) end, opts)

      opts.desc = "Hover typedef"
      vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)

      opts.desc = "Show diagnostic float"
      vim.keymap.set('n', '<Space>e', function() vim.diagnostic.open_float() end, opts)

      opts.desc = "Previous error"
      vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev() end, opts)

      opts.desc = "Next error"
      vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next() end, opts)

      opts.desc = "Smart rename"
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    for type, icon in ipairs(lsp_signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = ""
      })
    end

    for _, server in ipairs(lsp_servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
    end
  end
}
