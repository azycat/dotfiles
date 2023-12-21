-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
-- vim.go.background = "light"
vim.g.nvim_tree_respect_buf_cwd = 1

-- obsidian.nvim passthrough functionality
vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })

-- improve startup time (from impatient.nvim)
vim.loader.enable()

-- bind --mode=normal J tabnext
-- bind --mode=normal K tabprev
-- bind --mode=normal H back
-- bind --mode=normal L forward

-- local function map(mode, lhs, rhs, opts)
--   local options = { noremap = true, silent = true }
--   if opts then
--     if opts.desc then
--       opts.desc = "keymaps.lua: " .. opts.desc
--     end
--     options = vim.tbl_extend("force", options, opts)
--   end
--   vim.keymap.set(mode, lhs, rhs, options)
-- end

-- local function map(mode, lhs, rhs, opts)
--   local options = { noremap = true }
--   if opts then
--     options = vim.tbl_extend("force", options, opts)
--   end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end
