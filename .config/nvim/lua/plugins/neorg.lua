local CITY = os.getenv("CITY")

return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		Lazy = false,
		-- tag = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = CITY .. "/etc/neorg",
							},
						},
					},
				},
			})
		end,
	},
}
