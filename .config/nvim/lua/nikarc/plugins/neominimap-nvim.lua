return {
    "Isrothy/neominimap.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter", --- Recommended
    },
    enabled = true,
    lazy = false, -- NOTE: NO NEED to Lazy load
    init = function()
        vim.opt.wrap = false -- Recommended
        vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
        vim.g.neominimap = {
            auto_enable = true,
        }
    end,
}

