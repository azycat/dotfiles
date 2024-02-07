return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"rebelot/kanagawa.nvim"
	},

	-- enabled = false,
	opts = function()
		return require("plugins.lualine.minim")
	end

}
