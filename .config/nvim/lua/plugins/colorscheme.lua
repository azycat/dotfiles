return {
  { 'rktjmp/lush.nvim' },
  -- { "metalelf0/jellybeans-nvim" },
  --  { "pappasam/papercolor-theme-slim" },
  { 'mcchrish/zenbones.nvim' },

  priority = 1000, -- make sure to load this before all the other start plugins

  {
    'f-person/auto-dark-mode.nvim',
    config = {
      update_interval = 9000,
      set_dark_mode = function()
        -- vim.go.background = "dark"
        vim.api.nvim_set_option('background', 'dark')
        vim.cmd([[colorscheme randombones]])
      end,
      set_light_mode = function()
        -- vim.go.background = "light"
        vim.api.nvim_set_option('background', 'light')
        vim.cmd([[colorscheme randombones]])
      end,

      -- mini.starter highlighting
      vim.cmd([[
        augroup MiniStarterColors
    " ref: https://github.com/mcchrish/zenbones.nvim/blob/main/lua/zenbones/specs/light.lua
            au!
            au ColorScheme * highlight link MiniStarterItemPrefix TelescopeMatching
            au ColorScheme * highlight link MiniStarterSection TelescopeSelectionCaret
            au ColorScheme * highlight link MiniStarterHeader TelescopeBorderTelescopeSelection
            au ColorScheme * highlight link MiniStarterFooter TelescopeBorder
        augroup END
        ]]),
    },
  },

  --  hi DiagnosticUnderlineError guisp='Red' gui=underline
  --  hi DiagnosticUnderlineWarn guisp='Cyan' gui=undercurl
  -- set termguicolors
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "randombones",
  --   },
  -- },
}
