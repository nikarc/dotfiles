local function get_python_path()
    -- First check VIRTUAL_ENV
    local venv_path = os.getenv('VIRTUAL_ENV')
    if venv_path then
        return venv_path .. '/bin/python'
    end

    -- Then check for pipenv
    local pipfile = vim.fn.findfile('Pipfile', '.;')
    if pipfile ~= '' then
        -- Get pipenv path
        local pipenv_path = vim.fn.system('pipenv --venv'):gsub('%s+$', '')
        return pipenv_path .. '/bin/python'
    end

    -- Fallback to system Python
    return '/usr/bin/python3'
end

return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require('dap')
        dap.adapters.python = {
            type = 'executable',
            -- Use the project's Python if it exists, otherwise fall back to a default
            command = '/home/nick/.local/share/virtualenvs/RocketchipsAPI-LnDk7z6h/bin/python',
            args = { '-m', 'debugpy.adapter' },
        }

        -- Configure Python debugging
        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
                pythonPath = function()
                    -- First check VIRTUAL_ENV
                    local venv_path = os.getenv('VIRTUAL_ENV')
                    if venv_path then
                        return venv_path .. '/bin/python'
                    end

                    -- Then check for pipenv
                    local pipfile = vim.fn.findfile('Pipfile', '.;')
                    if pipfile ~= '' then
                        -- Get pipenv path
                        local pipenv_path = vim.fn.system('pipenv --venv'):gsub('%s+$', '')
                        return pipenv_path .. '/bin/python'
                    end

                    -- Fallback to system Python
                    return '/usr/bin/python3'
                end,
            },
            {
                -- Add configuration for running and debugging tests
                type = 'python',
                request = 'launch',
                name = "Python: Run Tests",
                module = 'pytest',
                args = {'${file}'},
                pythonPath = function()
                    local venv_path = os.getenv('VIRTUAL_ENV')
                    if venv_path then
                        return venv_path .. '/bin/python'
                    else
                        return '/usr/bin/python3'
                    end
                end,
            },
            {
                -- Add configuration for attaching to a running process
                type = 'python',
                request = 'attach',
                name = "Python: Attach",
                host = "127.0.0.1",
                port = 5678,
                pythonPath = function()
                    local venv_path = os.getenv('VIRTUAL_ENV')
                    if venv_path then
                        return venv_path .. '/bin/python'
                    else
                        return '/usr/bin/python3'
                    end
                end,
            },
            {
                type = 'python',
                request = 'attach',
                name = "Docker: Attach",
                connect = {
                    host = "localhost",  -- or your Docker host IP
                    port = 5678
                },
                pathMappings = {
                    -- Map the container path to your local path
                    -- Adjust these paths based on your project structure
                    {
                        localRoot = "${workspaceFolder}",  -- Your local code directory
                        remoteRoot = "/opt/rocketchips"  -- Path where code is in the container
                    }
                },
                -- justMyCode = false,  -- Set to false to step into library code
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
