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
        -- Python path; you can set this to a specific virtualenv if needed
        pythonPath = function()
          return python_path
        end;
      },
    }
  end,
}
