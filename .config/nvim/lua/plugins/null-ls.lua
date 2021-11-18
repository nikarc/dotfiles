local null_ls = require('null-ls')
local sources = {
    null_ls.builtins.formatting.prettierd.with({
      disabled_filetypes = { "json" }
    }),
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.config({ sources = sources })
