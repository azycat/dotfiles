-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then
      opts.desc = "keymaps.lua: " .. opts.desc
    end
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "gl", "`.", { desc = "Jump to the last change in the file" })
map("i", "<RightMouse>", '<C-o>:normal "+gp<CR>', { desc = "Use right mouse to paste clipboard + in insert mode" })

-- map("n", "<C-S-k>", "<S-k>", { desc = "alt map for shift+k" })
map("n", "<C-S-j>", "J", { desc = "Alt map for joining" })

-- map("n", "<S-j>", "<S-l>")
-- map("n", "<S-k>", "<S-h>")

-- local keymap = vim.api.nvim_set_keymap
-- local default_opts = { noremap = true, silent = true }

-- keymap("n", "<S-k>", ":bprevious<CR>", default_opts)
-- map("n", "<S-j>", ":bnext<CR>")
