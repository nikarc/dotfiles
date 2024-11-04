local utils = require('nikarc.utils')

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },
    keys = {
        { "<C-p>", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"},
        { "<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>"},
        { "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<CR>"},
        { "<C-g>", "<cmd>lua require('telescope.builtin').resume()<CR>"},
        { "<C-m>", "<cmd>Telescope import<CR>"},
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        import = {
            -- Add imports to the top of the file keeping the cursor in place
            insert_at_top = true,
            -- Support additional languages
            custom_languages = {
                {
                    -- The regex pattern for the import statement
                    regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
                    -- The Vim filetypes
                    filetypes = { "typescript", "typescriptreact", "javascript", "react", "python" },
                    -- The filetypes that ripgrep supports (find these via `rg --type-list`)
                    extensions = { "js", "ts", "py" },
                },
            },
        },
    },
    opts = function ()
        local function layout()
            if utils.is_linux() then
                return {}
            else
                return {
                    horizontal = {
                        width = 0.99,
                        -- preview_width = 50
                    }
                }
            end
        end

        return {
            defaults = {
                borderchars = {
                    prompt = { '▔', '▕', ' ', '▏', '🭽', '🭾', '▕', '▏' },
                    results = utils.border_chars_outer_thin_telescope,
                    preview = utils.border_chars_outer_thin_telescope,
                },
                -- path_display = {
                --   'smart'
                -- },
                layout_config = layout()
            },
        }
    end,
    config = function ()
        local telescope = require("telescope")

        -- first setup telescope
        telescope.setup()

        -- then load the extension
        telescope.load_extension("live_grep_args")
    end
}
