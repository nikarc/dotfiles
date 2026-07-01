return {
  "kokusenz/deltaview.nvim",
  dependencies = { "kokusenz/delta.lua" },
  config = function ()
    require('deltaview').setup({
      -- configuration here
      -- example:
      keyconfig = {
        dv_toggle_keybind = "<leader>cd"
      },
      use_nerdfonts = false
    })
  end
}
