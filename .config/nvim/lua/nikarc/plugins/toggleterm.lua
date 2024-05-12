local utils = require('nikarc.utils')

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]],
      size = 50,
      -- direction = 'tab',
    })

    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<C-x>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local function float_opts()
      if utils.is_linux() then
        return {
          border = 'curved',
          winblend = 3,
          highlights = {
            border = "Normal",
            background = "Normal",
          }
        }
      else
        return {
          border = 'curved',
          width = 150,
          height = 60,
          winblend = 3,
          highlights = {
            border = "Normal",
            background = "Normal",
          }
        }
      end
    end

    -- local Terminal  = require('toggleterm.terminal').Terminal
    -- local lazygit = Terminal:new({
    --   cmd = "lazygit",
    --   hidden = true,
    --   direction = 'float',
    --   autochdir = true,
    --   float_opts = float_opts(),
    -- })
    --
    -- function _lazygit_toggle()
    --   lazygit:toggle()
    -- end

    -- vim.api.nvim_set_keymap("n", "<Space>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
  end,
}
