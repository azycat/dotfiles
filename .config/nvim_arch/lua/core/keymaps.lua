local map = require("helpers.keys").map

map("n", "j", "gj", "visual down")
map("n", "k", "gk", "visual up")

-- Blazingly fast way out of insert mode
map("i", "jk", "<esc>")

-- Quick access to some common actions
map("n", "<leader>fw", "<cmd>w<cr>", "Write")
map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")
map("n", "<leader>dw", "<cmd>close<cr>", "Window")

-- Easier access to beginning and end of lines
map("n", "<M-h>", "^", "Go to beginning of line")
map("n", "<M-l>", "$", "Go to end of line")

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Deleting buffers
local buffers = require("helpers.buffers")
map("n", "<leader>bd", buffers.delete_this, "Delete current buffer")
map("n", "<leader>bo", buffers.delete_others, "Delete other buffers")
map("n", "<leader>bD", buffers.delete_all, "Delete all buffers")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Switch between light and dark modes
map("n", "<leader>ut", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, "Toggle between light and dark themes")

--- non-defaults
-- from lazyvim general configuration
map("n", "<esc>", "<cmd>nohl<cr><esc>", "Clear highlights")
map("n", "<leader>fn", "<cmd>enew<cr>", "New File")

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
map("n", "]d", diagnostic_goto(true), "Next Diagnostic")
map("n", "[d", diagnostic_goto(false), "Prev Diagnostic")
map("n", "]e", diagnostic_goto(true, "ERROR"), "Next Error")
map("n", "[e", diagnostic_goto(false, "ERROR"), "Prev Error")
map("n", "]w", diagnostic_goto(true, "WARN"), "Next Warning")
map("n", "[w", diagnostic_goto(false, "WARN"), "Prev Warning")

-- prints the current file name with `full path` and the current `buffer number`
map("n", "<C-g>", "2<C-g>")

-- lazygit
map("n", "<leader>gg", function()
	require("utils").float_term({ "lazygit" }, { cwd = require("utils").root(), esc_esc = false })
end, "Lazygit (root dir)")
map("n", "<leader>gG", function()
	require("utils").float_term({ "lazygit" }, { esc_esc = false })
end, "Lazygit (cwd)")
-- tig
