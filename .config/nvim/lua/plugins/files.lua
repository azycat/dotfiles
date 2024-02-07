return {
	"echasnovski/mini.files",
	version = false,
	lazy = false,
	keys = {
		{
			"<leader>e",
			-- toggle minifiles explorer view
			function()
				local MiniFiles = require("mini.files")
				if not MiniFiles.close() then
					local buf_path = vim.api.nvim_buf_get_name(0)
					local cwd = vim.fn.getcwd()
					if string.find(buf_path, "/Starter") then
						MiniFiles.open(cwd)
					else
						MiniFiles.open(buf_path)
					end
				end
			end,
			desc = "Toggle files",
		},
	},
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
