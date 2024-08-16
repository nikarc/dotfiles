local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
-- local typescriptreact = require("nikarc.snippets.typescriptreact")

-- ls.add_snippets("all", s(
--   {
--     trig = "rnfc",
--     name = "React Native Functional Component",
--     dscr = "React Native Functional Component, with StyleSheet and View imported",
--   },
--   {
--     t("import { StyleSheet, View } from 'react-native';"),
--     t("import viewStyles from '@src/styles/view';"),
--     t("const ${TM_FILENAME_BASE} = () => {"),
--     t("const ${TM_FILENAME_BASE} = () => {"),
--   }
-- ))

ls.add_snippets("all", {
	s("rnfc", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    t([[this is a test
    this ia a newline]]),
    t('this is a test'),
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	})
})
