return {
  { "rktjmp/lush.nvim" },
  -- { "metalelf0/jellybeans-nvim" },
  --  { "pappasam/papercolor-theme-slim" },
  { "mcchrish/zenbones.nvim" },

  priority = 1000, -- make sure to load this before all the other start plugins

  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 9000,
      set_dark_mode = function()
        -- vim.go.background = "dark"
        vim.api.nvim_set_option("background", "dark")
        vim.cmd([[colorscheme randombones]])
      end,
      set_light_mode = function()
        -- vim.go.background = "light"
        vim.api.nvim_set_option("background", "light")
        vim.cmd([[colorscheme randombones]])
      end,
    },
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "randombones",
  --   },
  -- },
}
