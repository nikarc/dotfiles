local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

local M = {}

M.rn_functional_component = s(
  {
    trig = "rnfc",
    name = "React Native Functional Component",
    dscr = "React Native Functional Component, with StyleSheet and View imported",
  },
  {
    t("import { StyleSheet, View } from 'react-native';\n"),
    t("import viewStyles from '@src/styles/view';\n\n"),
    t("const ${TM_FILENAME_BASE} = () => {\n"),
    t("const ${TM_FILENAME_BASE} = () => {\n"),
  }
)


  -- f(function()
  --   local buffer = vim.api.nvim_get_current_buf()
  --   local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
  --   table.insert(lines, 1, "")
  --   table.insert(lines, 1, "import os")
  --   vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
  --   return ""
  -- end, {})

return M
