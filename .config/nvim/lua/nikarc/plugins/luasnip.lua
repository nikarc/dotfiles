return {
	"L3MON4D3/LuaSnip",
  enabled = false,
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
  config = function()
    local ls = require('luasnip')
    local s = ls.snippet
    local f = ls.function_node
    -- require('nikarc.snippets')
    -- require("luasnip").config.setup({
    --   history = true,
    --   updateevents = "TextChanged,TextChangedI",
    -- })
    -- require("luasnip.loaders.from_vscode").lazy_load()

    vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
    -- vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
    -- vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

    -- vim.keymap.set({"i", "s"}, "<C-E>", function()
    --   if ls.choice_active() then
    --     ls.change_choice(1)
    --   end
    -- end, {silent = true})

    ls.config.setup({store_selection_keys="<Tab>"})

    ls.add_snippets("typescriptreact", {
      s("console", f(function(_, snip)
        local res, env = {}, snip.env
        for _, ele in ipairs(env.LS_SELECT_RAW) do
          local var_name = select(2, string.match(ele, 'const (%w+)'))

          table.insert(res, ele)
          table.insert(res, 1, "console.log(JSON.stringify(" .. var_name .. ", null, 2));")
        end

        return res
      end))
    })

    require("luasnip.loaders.from_vscode").lazy_load({
      paths = "~/.config/nvim/snippets"
    })

  end
}
