return {
  "echasnovski/mini.files",
  version = false,
  lazy = false,
  keys = function()
    -- toggle minifiles explorer view
    local minifiles_toggle = function()
      if not MiniFiles.close() then
        -- change directory if we're in /orgagenda
        local org_path = "~/Documents/vault/org"
        local cur_path = vim.api.nvim_buf_get_name(0)
        if cur_path == "/orgagenda" then
          vim.fn.chdir(vim.fn.expand(org_path))
          MiniFiles.open(org_path)
        else
          MiniFiles.open(cur_path)
        end
      end
    end
    return {
      {
        "<leader>e",
        minifiles_toggle,
        desc = "Open in Minifiles",
      },
    }
  end,
  opts = function()
    return {
      mappings = {
        go_in_plus = "<cr>",
        synchronize = ":w<cr>",
      },
      options = {
        -- Whether to use for editing directories
        use_as_default_explorer = true,
      },
      windows = {
        preview = false,
      },
    }
  end,
}
