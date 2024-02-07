local plugin = {
	"echasnovski/mini.nvim",
	version = false,
	event = "VimEnter",
	keys = {
		{ "<leader>0", "<cmd>lua MiniStarter.open()<cr>", desc = "Return to nothing" },
	},
	opts = function()
		local prefix_excludes = { "a", "c", "e", "q", "o" }

		local h1 = table.concat({
			[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
			[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
			[[/ /\  /  __/ (_) \ V /| | | | | | |]],
			[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
			[[───────────────────────────────────]],
		}, "\n")
		local h2 = [[
    ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
    │││├┤ │ │╰┐┌╯││││
    ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
    ]]
		local starter = require("mini.starter")

		local config = {
			evaluate_single = true,
			footer = os.date(),
			header = h2,
			query_updaters = [[abcdefghimopqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
			items = {
				starter.sections.recent_files(5, false, false),
				{
					action = "e ~/.config/nvim/lua",
					name = "c] config",
					section = "Builtin actions",
				},
				{
					action = "Neorg workspace notes",
					name = "o] neorg",
					section = "Builtin actions",
				},
				{ action = "enew | startinsert", name = "e] new buffer",  section = "Builtin actions" },
				{ action = "qall!",              name = "q] quit neovim", section = "Builtin actions" },
			},
			content_hooks = {
				-- add padding between section header and content
				function(content)
					local blank_content_line = { { type = "empty", string = "" } }
					local section_coords = starter.content_coords(content, "section")
					-- Insert backwards to not affect coordinates
					for i = #section_coords, 1, -1 do
						table.insert(content, section_coords[i].line + 1, blank_content_line)
					end
					return content
				end,

				-- item styling attempt #2.
				function(content)
					local place_cursor = false
					local exclude_sections = { "Recent files", "Sessions" }

					local coords = starter.content_coords(content, "item")
					-- Go backwards to avoid conflict when inserting units
					for i = #coords, 1, -1 do
						local l_num, u_num = coords[i].line, coords[i].unit
						local unit = content[l_num][u_num]
						local item = unit.item
						-- cut up item string
						local item_str = unit.string
						local prefix = item_str:sub(1, 1)
						local label = item_str:sub(2)

						-- important sections start with a unique [x] bullet
						if not vim.tbl_contains(exclude_sections, item.section) then
							local bullet_unit = {
								string = "[",
								type = "item_bullet",
								hl = "MiniStarterItemBullet",
								-- Use '_item' instead of 'item' because it is better to be private
								_item = item,
								_place_cursor = place_cursor,
							}
							-- dumb ass method to turn the rest of the item string into an end bullet
							unit.string = prefix
							local end_bullet = {
								string = label,
								type = "item_bullet",
								hl = "MiniStarterItemBullet",
								-- Use '_item' instead of 'item' because it is better to be private
								_item = item,
								_place_cursor = place_cursor,
							}
							table.insert(content[l_num], u_num, bullet_unit)
							table.insert(content[l_num], u_num + 2, end_bullet)
						else -- excluded sections need to shift their labels to avoid prefix conflict
							if vim.tbl_contains(prefix_excludes, prefix) then
								local new_prefix = prefix
								local new_label = label
								repeat
									new_prefix = prefix .. new_label:sub(1, 1)
									new_label = new_label:sub(2)
								until not vim.tbl_contains(prefix_excludes, new_label:sub(1, 1))
									or string.len(new_label) <= 1
								local prefix_bullet = {
									string = new_prefix,
									type = "item_bullet",
									_item = item,
									_place_cursor = false,
								}
								unit.string = new_label
								table.insert(content[l_num], u_num, prefix_bullet)
							end
						end
					end
					return content
				end,
				starter.gen_hook.aligning("center", "center"),
				-- starter.gen_hook.
			},
			-- allow jkl navigation
			vim.cmd([[
    augroup MiniStarterJK
        au!
        au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
        au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
        au User MiniStarterOpened nmap <buffer> l <Cmd>lua MiniStarter.eval_current_item()<CR>
        au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
        au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>Telescope file_browser<CR>
    augroup END

    ]]),
		}
		return config
	end,

	config = function(_, config)
		-- close Lazy and re-open when starter is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniStarterOpened",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("mini.sessions").setup({
			-- Whether to read latest session if Neovim opened without file arguments
			autoread = false,
			-- Whether to write current session before quitting Neovim
			autowrite = true,
			-- Directory where global sessions are stored (use `''` to disable)
			directory = "~/.vim/sessions", --<"session" subdir of user data directory from |stdpath()|>,
			-- File for local session (use `''` to disable)
			file = "", -- 'Session.vim',
		})

		require("mini.starter").setup(config)

		-- vim.api.nvim_set_hl(0, "DashboardFooter", { fg = palette.sky })
		-- vim.api.nvim_set_hl(0, 'MiniStarterItemPrefix', { link = 'Bold' })
	end,
}

return plugin
