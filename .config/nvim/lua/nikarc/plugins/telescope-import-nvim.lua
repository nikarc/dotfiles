return {
  'piersolenski/telescope-import.nvim',
  dependencies = 'nvim-telescope/telescope.nvim',
  enabled = false,
  config = function()
    require("telescope").load_extension("import")
  end
}
