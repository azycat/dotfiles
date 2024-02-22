local function get_notebook()
	if vim.fn.has('macunix') then
		return "~/Documents/vault/struppi-city"
	else -- i only have two computers lol
		return "~/53chan/struppi-city"
	end
end

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
								notes = get_notebook() .. "/etc/neorg",
							},
						},
					},
				},
			})
		end,
	},
}
