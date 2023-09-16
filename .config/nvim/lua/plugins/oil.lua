return {
  "stevearc/oil.nvim",
  keys = {
    { "<leader>fo", "<cmd>Oil --float %:p:h<cr>", desc = "Open working buffer in Oil" },
    { "<leader>fO", "<cmd>Oil --float<cr>", desc = "Open CWD in Oil" },
  },
  opts = {
    delete_to_trash = true,
    trash_command = "gomi",
  },
}
