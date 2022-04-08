-- https://github.com/echasnovski/mini.nvim

require('mini.indentscope').setup({
  draw = {
    animation = function(s, n)
      return 10
    end
  }
})
