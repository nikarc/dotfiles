return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  opts = {
    -- add any opts here
    provider = "openai"
    -- provider = "ollama",
    -- vendors = {
    --   ollama = {
    --     ["local"] = true,
    --     endpoint = "127.0.0.1:11434/api",
    --     model = "llama3.1:latest",
    --     parse_curl_args = function(opts, code_opts)
    --       local curl_args = {
    --         url = opts.endpoint .. "/chat",
    --         headers = {
    --           ["Accept"] = "application/json",
    --           ["Content-Type"] = "application/json",
    --         },
    --         body = {
    --           model = opts.model,
    --           messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
    --           max_tokens = 2048,
    --           stream = true,
    --         },
    --       }
    --       vim.api.nvim_out_write(tostring(curl_args))
    --
    --       return curl_args
    --     end,
    --     parse_response_data = function(data_stream, event_state, opts)
    --       require("avante.providers").openai.parse_response(data_stream, event_state, opts)
    --     end,
    --   },
    -- },
  },
  -- if you want to download pre-built binary, then pass source=false. Make sure to follow instruction above.
  -- Also note that downloading prebuilt binary is a lot faster comparing to compiling from source.
  build = ":AvanteBuild source=false",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to setup it properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
