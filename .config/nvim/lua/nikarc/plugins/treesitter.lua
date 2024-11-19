return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-refactor",
    },
    opts = {
        highlight = {
            enable = true,
        },
        autopairs = { enable = true },
        autotag = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "vimdoc",
            "javascript",
            "typescript",
            "c",
            "lua",
            "rust",
            "graphql",
        },
        sync_install = true,
        refactor = {
            highlight_definitions = {
                enable = true,
                -- Set to false if you have an `updatetime` of ~100.
                clear_on_cursor_move = true,
            }
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
