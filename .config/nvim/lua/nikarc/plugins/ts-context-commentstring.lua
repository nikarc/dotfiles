return {
  'JoosepAlviste/nvim-ts-context-commentstring',
  setup = function()
    require('ts_context_commentstring').setup {
      enable_autocmd = false,
    }
  end
}
