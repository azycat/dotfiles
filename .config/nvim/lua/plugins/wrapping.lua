return {
	"andrewferrier/wrapping.nvim",

	keys = {
		{ "<leader>uw", "<cmd>lua require('wrapping').toggle_wrap_mode()<cr>", desc = "Toggle word wrapping" },
	},
	opts = {
	},
	config = function()
		require("wrapping").setup(opts)
	end,
}
