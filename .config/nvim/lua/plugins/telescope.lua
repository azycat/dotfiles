local U = require("utils")

-- Telescope fuzzy finding (all the things)
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
		},
		keys = {
			-- find
			{ "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>ff", U.telescope("files"), desc = "Find Files (root dir)" },
			{ "<leader>fF", U.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
			{
				"<leader>fP",
				function()
					require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
				end,
				desc = "Find Plugin File",
			},
			-- git
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
			-- search
			{ "<leader>s:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
			{
				"<leader>sw",
				function()
					require("telescope-live-grep-args.shortcuts").grep_word_under_cursor({ postfix = false })
				end,
				desc = "Grep keyword under cursor (root dir)",
				mode = { "n" },
			},
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-d>"] = actions.preview_scrolling_down,
							["<C-u>"] = actions.preview_scrolling_up,
						},
						n = {
							["q"] = actions.close,
						},
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")

			local map = require("helpers.keys").map
			map("n", "<leader>fr", require("telescope.builtin").oldfiles, "Recently opened")
			map("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, "Search in current buffer")

			-- map("n", "<leader>sf", require("telescope.builtin").find_files, "Files")
			map("n", "<leader>sh", require("telescope.builtin").help_tags, "Help")
			-- map("n", "<leader>sw", require("telescope.builtin").grep_string, "Current word")
			map("n", "<leader>sg", require("telescope.builtin").live_grep, "Grep")
			map("n", "<leader>sd", require("telescope.builtin").diagnostics, "Diagnostics")

			map("n", "<leader>sk", require("telescope.builtin").keymaps, "Search keymaps")
		end,
	},
}
