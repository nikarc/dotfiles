local ts_node_action =  require("ts-node-action")

ts_node_action.setup({})

vim.keymap.set({ "n" },
  "<Space>k",
  ts_node_action.node_action,
  { desc = "Trigger Node Action" }
)
