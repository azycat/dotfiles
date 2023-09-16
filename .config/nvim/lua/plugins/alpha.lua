return {
  "goolord/alpha-nvim",
  dependencies = {
    "epwalsh/obsidian.nvim",
    "ahmedkhalf/project.nvim",
    "nvim-orgmode/orgmode",
  },
  keys = { {
    "<leader>wa",
    "<cmd>Alpha <cr>",
    desc = "Return to home.",
  } },
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    local logo = [[
            . ∧＿∧　
            （ ºωº )つ━☆・*。
            ⊂|　　 | 　　　・゜+.
            　しーＪ　　　°。+ *´¨)
            　　　　　　　　　.• ´¸.•*´¨) ¸.•*¨)
            　　　　　　　　　　(¸.•´ (¸.•'* ☆ nyowa ☆
        ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      -- dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      -- dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("r", " " .. " Recent projects", ":Telescope projects <cr>"),
      dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button(
        "n",
        "󱓧 " .. " notebook",
        "<cmd>cd ~/Documents/vault/notebook <bar> Telescope file_browser <cr>"
      ),
      dashboard.button("v", " " .. " struppi-city", ":ObsidianToday <cr>"),
      dashboard.button(
        "o",
        " " .. " orgsmode",
        ":e ~/Documents/vault/org/refile.org <bar>" .. [[:lua require("orgmode.agenda"):agenda() <cr>]]
      ),
      -- dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
  end,
}
