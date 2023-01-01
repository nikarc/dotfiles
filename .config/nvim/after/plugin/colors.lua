local color = 'rose-pine'
local colorscheme = require(color)

colorscheme.setup({
  dark_variant = 'moon',
	disable_background = true,
	disable_float_background = true,
})

vim.cmd.colorscheme(color)
