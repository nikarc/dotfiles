return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')

    -- Path to the Python interpreter
    local python_path = '/usr/bin/python'  -- Adjust if necessary

    -- Set up the Python debug adapter
    dap.adapters.python = {
      type = 'executable';
      command = python_path;  -- Path to python
      args = { '-m', 'debugpy.adapter' };
    }

    -- Configure Python debugging
    dap.configurations.python = {
      {
        -- The type here established the link to the adapter
        type = 'python';
        request = 'launch';
        name = "Launch file";

        -- Program to debug (the current file)
        program = "${file}";
        -- Automatically set the cwd to the workspace folder
        cwd = "${workspaceFolder}";
        pythonPath = function()
          -- Use activated virtualenv or fallback to default Python
          local venv_path = os.getenv('VIRTUAL_ENV')
          if venv_path then
            return venv_path .. '/bin/python'
          else
            return python_path
          end
        end,
      },
    }

    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('n', '<F5>', "<Cmd>lua require'dap'.continue()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<F10>', "<Cmd>lua require'dap'.step_over()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<F11>', "<Cmd>lua require'dap'.step_into()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<F12>', "<Cmd>lua require'dap'.step_out()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<Leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<Leader>B', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
    vim.api.nvim_set_keymap('n', '<Leader>lp', "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
    vim.api.nvim_set_keymap('n', '<Leader>dr', "<Cmd>lua require'dap'.repl.open()<CR>", opts)
    vim.api.nvim_set_keymap('n', '<Leader>dl', "<Cmd>lua require'dap'.run_last()<CR>", opts)
  end,
}
