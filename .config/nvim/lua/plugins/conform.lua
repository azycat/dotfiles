return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		event = { "LazyFile" },
		lazy = true,
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
					-- require("conform").format({ formatters = { "injected" } }) format injected langs
				end,
				mode = { "n", "v" },
				desc = "Format Buffer",
			},
			{ "<leader>cm", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
		},
		opts = {
			-- LazyVim will use these options when formatting with the conform.nvim formatter
			format = {
				timeout_ms = 3000,
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				-- fish = { "fish_indent" },
				sh = { "shfmt" },
				javascript = { { "prettierd", "prettier" } },
				c = { "clangd" },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500, lsp_fallback = true },

			-- The options you set here will be merged with the builtin formatters.
			-- You can also define any custom formatters here.
			formatters = {
				injected = { options = { ignore_errors = true } },
				-- # Example of using dprint only when a dprint.json file is present
				-- dprint = {
				--   condition = function(ctx)
				--     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
				--   end,
				-- },
				--
				-- # Example of using shfmt with extra args
				shfmt = {
					prepend_args = { "-i", "2", "-ci" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
