-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- ref: https://github.com/mstuttgart/dotfiles/blob/900a5cff9dba31edbb44f68970485efb59d3dfe3/.config/nvim/lua/core/autocommands.lua
local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

vim.api.nvim_create_augroup('bufcheck', { clear = true })

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = augroup('resize_splits'),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})
-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- close some filetypes with <q>
-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("close_with_q"),
--   pattern = {
--     "PlenaryTestPopup",
--     "help",
--     "lspinfo",
--     "man",
--     "notify",
--     "qf",
--     "spectre_panel",
--     "startuptime",
--     "tsplayground",
--     "checkhealth",
--   },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--     vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
--   end,
-- })

-- sync clipboards because I'm easily confused
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = "bufcheck",
--   pattern = "*",
--   callback = function()
--     vim.fn.setreg("+", vim.fn.getreg("*"))
--   end,
-- })
