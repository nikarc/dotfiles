return {
    'numToStr/Comment.nvim',
    enabled = false,
    opts = {
        -- add any options here
    },
    lazy = false,
    setup = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
}

