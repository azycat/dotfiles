return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      enable = true,
      addtional_vim_regex_highlighting = { "org", "markdown" },
    },
    ensure_installed = { "org", "markdown", "markdown_inline" },
  },
}
