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

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    local on_attach = function ()
      opts.buffer = bufnr

      -- Keymaps
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "gd", vim.lsp.buf.declaration, opts)

      opts.desc = "Show LSP declarations"
      keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "Show LSP Type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions", opts)

      opts.desc = "See available code actions"
      keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float)

      opts.desc = "LSP Restart"
      keymap.set("n", "<leader>rs", "<cmd>LspRestart", opts)
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
