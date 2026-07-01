return {
  "mistricky/codesnap.nvim",
  enabled = false,
  tag = "v2.0.0",
  config = function()
    -- https://github.com/mistricky/codesnap.nvim/issues/179
    local cpath = package.cpath
    require('codesnap').setup({
      -- your options here
    })
    package.cpath = cpath
  end,
}
