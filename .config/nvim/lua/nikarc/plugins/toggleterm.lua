local utils = require('nikarc.utils')
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function toggle_telescope(opts)
  opts = opts or {}

  -- Get all terminal instances
  local terminals = require("toggleterm.terminal").get_all()

  -- Convert terminals to picker entries
  local results = {}
  for _, term in pairs(terminals) do
    table.insert(results, {
      id = term.id,
      name = term.display_name or ("Terminal " .. term.id),
      direction = term.direction,
      cmd = term.cmd or "",
      terminal = term,
    })
  end

  pickers.new(opts, {
    prompt_title = "Toggleterm Terminals",
    finder = finders.new_table({
      results = results,
      entry_maker = function(entry)
        return {
          value = entry,
          display = string.format("[%d] %s (%s) %s",
            entry.id,
            entry.name,
            entry.direction,
            entry.cmd ~= "" and "- " .. entry.cmd or ""
          ),
          ordinal = string.format("%d %s %s", entry.id, entry.name, entry.cmd),
        }
      end,
    }),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      -- Default action: toggle terminal
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        selection.value.terminal:toggle()
      end)

      -- Delete terminal with <C-d>
      map("i", "<C-d>", function()
        local selection = action_state.get_selected_entry()
        local current_picker = action_state.get_current_picker(prompt_bufnr)

        -- Close/shutdown the terminal
        selection.value.terminal:shutdown()

        -- Remove from picker
        current_picker:delete_selection(function(sel)
          -- Optional: refresh the picker to show updated list
        end)
      end)

      map("n", "<C-d>", function()
        local selection = action_state.get_selected_entry()
        local current_picker = action_state.get_current_picker(prompt_bufnr)

        selection.value.terminal:shutdown()
        current_picker:delete_selection(function(sel)
        end)
      end)

      -- Rename terminal with <C-r>
      map("i", "<C-r>", function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        vim.ui.input({ prompt = "Terminal name: " }, function(input)
          if input then
            selection.value.terminal.display_name = input
            -- Reopen picker to show updated name
            toggle_telescope(opts)
          end
        end)
      end)

      map("n", "<C-r>", function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        vim.ui.input({ prompt = "Terminal name: " }, function(input)
          if input then
            selection.value.terminal.display_name = input
            toggle_telescope(opts)
          end
        end)
      end)

      return true
    end,
  }):find()
end

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

    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      -- direction = 'float',
      autochdir = true,
      -- float_opts = float_opts(),
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    vim.keymap.set("n", "<leader>tq", toggle_telescope, { desc = "Telescope Toggleterm" })
    vim.keymap.set("n", "<leader>nt", "<cmd>TermNew<CR>", { desc = "Open new toggleterm terminal" })
  end,
}
