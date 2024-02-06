return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {--[[ things you want to change go here]]
		},
		keys = {
			{
				"<leader>tt",
				"<cmd>ToggleTerm<CR>",
				desc = "toggleterm here",
				mode = { "n", "t" },
			},
			{
				"<leader>tg",
				mode = "n",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
					local lazygit = Terminal:new({
						cmd = "lazygit",
						dir = "git_dir",
						direction = "float",
						float_opts = {
							border = "double",
						},
						-- function to run on opening the terminal
						on_open = function(term)
							vim.cmd("startinsert!")
							vim.api.nvim_buf_set_keymap(
								term.bufnr,
								"n",
								"q",
								"<cmd>close<CR>",
								{ noremap = true, silent = true }
							)
						end,
						-- function to run on closing the terminal
						on_close = function(term)
							vim.cmd("startinsert!")
						end,
					})
					lazygit:toggle()
				end,
				desc = "Open Lazygit in new Terminal",
			},
			{
				"<leader>tf",
				mode = "n",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					local vifm = Terminal:new({
						cmd = "vifm",
						dir = "git_dir",
						direction = "float",
						float_opts = {
							border = "single",
						},
						-- function to run on opening the terminal
						on_open = function(term)
							vim.cmd("startinsert!")
							vim.api.nvim_buf_set_keymap(
								term.bufnr,
								"n",
								"q",
								"<cmd>close<CR>",
								{ noremap = true, silent = true }
							)
						end,
						-- function to run on closing the terminal
						on_close = function(term)
							vim.cmd("startinsert!")
						end,
					})
					vifm:toggle()
				end,
				desc = "Open Vifm in new Terminal",
			},
		},
	},
}
