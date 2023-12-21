return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  opts = {
    theme = "hyper",
    config = {
      shortcut = {
        {
          desc = "new file ",
          group = "DashboardShortCut",
          key = "e",
          action = "ene | startinsert",
        },
        {
          desc = "projects ",
          group = "DashboardShortCut",
          key = "p",
          action = "Telescope projects",
        },
        {
          desc = "config ",
          group = "DashboardShortCut",
          key = "c",
          action = [[lua require("lazyvim.util").telescope.config_files()()]],
        },
        {
          desc = "org ",
          group = "DashboardShortCut",
          key = "o",
          -- action = "e ~/Documents/vault/org/inbox.org | " .. [[lua require("orgmode.agenda"):agenda()]],
          action = [[lua require ("orgmode").action('agenda.agenda')]],
        },
      },
      header = {
        "<(^O^)> Today is a good day to code! <(^O^)>",
        "",
      },
      footer = {
        -- [[]],
        -- [[]],
        -- "Do, or do not.",
        -- "There is no try.",
        -- [[]],
      },
    },
  },
  config = function(_, opts)
    local dashboard = require("dashboard")
    dashboard.setup(opts)
    -- local colorscheme = vim.g.colors_name
    -- local palette = require(colorscheme .. [[.palette]])
    -- vim.api.nvim_set_hl(0, "DashboardHeader", { fg = palette.water })
    -- vim.api.nvim_set_hl(0, "DashboardFooter", { fg = palette.sky })
    local bufnr = vim.api.nvim_get_current_buf()
    for i, _ in ipairs(opts.config.header) do
      vim.api.nvim_buf_add_highlight(bufnr, 0, "DashboardHeader", i - 1, 0, -1)
    end
  end,
}
