require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.prettierd.with({
      disabled_filetypes = { "json" }
    }),
    require("null-ls").builtins.diagnostics.write_good,
    require("null-ls").builtins.code_actions.gitsigns,
  },
  on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
  end
})
