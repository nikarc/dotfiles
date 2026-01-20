return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    opt = true,
  },
  config = function()
    local bubbles_theme = require("nightfox.util.lualine")("nightfox")

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = {
          {
            'filename',
            path = 1
          },
          'branch',
          -- Show terminal info
          {
            function()
              if vim.bo.filetype == 'toggleterm' then
                local toggle_num = vim.b.toggle_number
                local term_title = vim.b.term_title

                if toggle_num then
                  if term_title and term_title ~= '' then
                    return string.format('Term %s: %s', toggle_num, term_title)
                  else
                    return string.format('Terminal %s', toggle_num)
                  end
                end
              end
              return ''
            end,
            icon = '',
            color = { fg = '#98c379', gui = 'bold' },
          },
        },
        lualine_c = {
          'fileformat',
          -- Show all open terminals
          {
            function()
              local terminals = require("toggleterm.terminal").get_all()
              local result = {}

              for _, term in pairs(terminals) do
                local name

                -- Priority: display_name > cmd > "shell"
                if term.display_name and term.display_name ~= '' then
                  name = term.display_name
                elseif term.cmd and term.cmd ~= '' then
                  -- Extract just the command name (first word)
                  name = term.cmd:match("^%S+") or term.cmd
                else
                  -- For terminals without a specific command, try to get the shell process
                  name = "shell"
                end

                table.insert(result, string.format('%d:%s', term.id, name))
              end

              if #result > 0 then
                return table.concat(result, ' ')
              end
              return ''
            end,
            icon = '',
            color = { fg = '#61afef' },
            cond = function()
              return vim.bo.filetype ~= 'toggleterm'
            end,
          },
        },
        lualine_x = {},
        lualine_y = {
          'filetype',
          'progress',
          -- Display number of loaded buffers
          {
            function()
              local is_loaded = vim.api.nvim_buf_is_loaded
              local tbl = vim.api.nvim_list_bufs()
              local loaded_bufs = 0
              for i = 1, #tbl do
                if is_loaded(tbl[i]) then
                  loaded_bufs = loaded_bufs + 1
                end
              end
              return loaded_bufs
            end,
            icon = "",
            color = { fg = "DarkCyan", gui = "bold" },
          },
        },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end
}
