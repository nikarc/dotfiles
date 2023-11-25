return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function ()
    require('copilot').setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-e>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      -- filetypes = {
      --   yaml = false,
      --   markdown = false,
      --   help = false,
      --   gitcommit = false,
      --   gitrebase = false,
      --   hgcommit = false,
      --   svn = false,
      --   cvs = false,
      --   ["."] = false,
      -- },
      -- copilot_node_command = 'node', -- Node.js version must be > 18.x
      -- server_opts_overrides = {},
    })
  end
}