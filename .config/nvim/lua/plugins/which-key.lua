return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local wk = require("which-key")
			wk.setup()
			wk.register({
				["<leader>"] = {
					f = { name = "File" },
					b = { name = "Buffer" },
					c = { name = "code" },
					d = { name = "Delete/Close" },
					q = { name = "Quit" },
					s = { name = "Search" },
					l = { name = "LSP" },
					u = { name = "UI" },
					g = { name = "Git" },
				},
			})
		end,
	},
}
