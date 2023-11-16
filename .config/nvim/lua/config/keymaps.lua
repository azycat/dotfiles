-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local keymap = vim.api.nvim_set_keymap
-- local default_opts = { noremap = true, silent = true }
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then
      opts.desc = 'keymaps.lua: ' .. opts.desc
    end
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map('n', 'gl', '`.', { desc = 'Jump to the last change in the file' })
map('i', '<RightMouse>', '<C-o>:normal "+gp<CR>', { desc = 'Use right mouse to paste clipboard + in insert mode' })

-- use ctrl+backspace to delete entire words
vim.keymap.set('i', '<C-BS>', '<Esc>cvb', {})

-- remap y to ygv<esc> in visual mode so the cursor does not jump back to where you started the selection
-- can also be achieved with marks with may`a
map('v', 'y', 'ygv<esc>', { desc = 'yank in visual mode without jumping back' })
