return {
  "nvimtools/none-ls.nvim",
  config = function ()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")
    vim.keymap.set('n', '<Space>fb', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
    null_ls.setup({
      sources = {
        -- Python formatters
        null_ls.builtins.formatting.black.with({
          command = "/opt/homebrew/bin/black",
        }),
        null_ls.builtins.formatting.isort.with({
          extra_args = { "--remove-redundant-aliases", "--profile", "black" }
        }),

        -- Add other formatters you want
        null_ls.builtins.formatting.prettier, -- for JS/TS/CSS/etc
        -- null_ls.builtins.diagnostics.eslint,
      },
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end
}
