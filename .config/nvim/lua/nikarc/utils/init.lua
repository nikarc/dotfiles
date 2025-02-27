local M = {}

M.git_colors = {
    GitAdd = "#A1C281",
    GitChange = "#74ADEA",
    GitDelete = "#FE747A",
}
M.lsp_signs = { Error = "🔥", Hint = "💡", Info = "💡", Warn = "⚠️'" }


M.border_chars_round = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
M.border_chars_none = { '', '', '', '', '', '', '', '' }
M.border_chars_empty = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }
M.border_chars_inner_thick = { ' ', '▄', ' ', '▌', ' ', '▀', ' ', '▐' }
M.border_chars_outer_thick = { '▛', '▀', '▜', '▐', '▟', '▄', '▙', '▌' }
M.border_chars_cmp_items = { '▛', '▀', '▀', ' ', '▄', '▄', '▙', '▌' }
M.border_chars_cmp_doc = { '▀', '▀', '▀', ' ', '▄', '▄', '▄', '▏' }
M.border_chars_outer_thin = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' }
M.border_chars_inner_thin = { ' ', '▁', ' ', '▏', ' ', '▔', ' ', '▕' }
M.border_chars_outer_thin_telescope = { '▔', '▕', '▁', '▏', '🭽', '🭾', '🭿', '🭼' }
M.border_chars_outer_thick_telescope = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' }

M.mason_packages = {
    "bash-language-server",
    "black",
    "clang-format",
    "clangd",
    "codelldb",
    "cspell",
    "css-lsp",
    "eslint-lsp",
    "graphql-language-service-cli",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "markdownlint",
    "prettier",
    "pyright",
    "shfmt",
    "tailwindcss-language-server",
    "taplo",
    "typescript-language-server",
    "yaml-language-server",
    -- "gopls",
    "editorconfig-checker"
}
M.lsp_servers = {
    -- Manually set up clangd
    -- "clangd",
    "bashls",
    "cssls",
    "eslint",
    "graphql",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "tailwindcss",
    "taplo",
    "ts_ls",
    "yamlls",
    -- "gopls",
}

M.lsp_server_handlers = {
  ts_ls = {
    ["textDocument/publishDiagnostics"] = function(
      _,
      result,
      ctx,
      config
    )
      if result.diagnostics == nil then
        return
      end

      -- ignore some ts_ls diagnostics
      local idx = 1
      while idx <= #result.diagnostics do
        local entry = result.diagnostics[idx]

        local formatter = require('format-ts-errors')[entry.code]
        entry.message = formatter and formatter(entry.message) or entry.message

        -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
        if entry.code == 80001 then
          -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
          table.remove(result.diagnostics, idx)
        else
          idx = idx + 1
        end
      end

      vim.lsp.diagnostic.on_publish_diagnostics(
        _,
        result,
        ctx,
        config
      )
    end,
  }
}

M.kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

M.is_linux = function ()
 return vim.uv.os_uname().sysname == 'Linux'
end

-- Function to retrieve the RGB values of a highlight group
M.get_hl_color = function(hl_group)
    local hl = vim.api.nvim_get_hl_by_name(hl_group, true)
    return string.format('#%06x', hl.foreground)
end

return M
