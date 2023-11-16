return {
  "folke/noice.nvim",
  event = "VeryLazy",

  opts = {
    presets = {
      command_palette = true,
      long_message_to_split = false,
      inc_rename = true,
    },

    -- hide `written` messages
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      -- ignore agenda view
      -- {
      --   filter = {
      --     find = "agenda command:",
      --   },
      -- },
      -- -- ignore capture view
      -- {
      --   filter = {
      --     find = "capture template",
      --   },
      -- },
    },

    -- disable LSP messages
    --
    cmdline = {
      title = "nya?",
    },

    messages = {
      -- enabled = false,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
      --   -- Using kevinhwang91/nvim-hlslens because virtualtext is hard to read
      -- view_search = false,
    },
    --
    lsp = {
      -- j-hui/fidget.nvim
      progress = {
        enabled = false,
      },
      -- hover = {
      --   -- enabled = false,
      -- },
      -- signature = {
      --   enabled = false,
      -- },
      message = {
        -- enabled = false,
        view = "mini",
      },
    },
    smart_move = {
      enabled = false,
    },

    commands = {
      history = {
        view = "split",
      },
      last = {
        view = "popup",
      },
      errors = {
        view = "popup",
      },
    },

    notify = {
      enabled = false,
    },

    -- health = {
    --   checker = false,
    -- },
  },
}
