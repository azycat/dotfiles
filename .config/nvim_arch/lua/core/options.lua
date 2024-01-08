local opts = {
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4, -- Number of spaces inserted instead of a TAB character
	expandtab = true,
	wrap = false,
	termguicolors = true,
	number = true,
	relativenumber = true,
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
vim.g.nvim_tree_respect_buf_cwd = 1
-- improve startup time (from impatient.nvim)
vim.loader.enable()
