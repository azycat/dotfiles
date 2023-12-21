return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-file-browser.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local fb_actions = require('telescope._extensions.file_browser.actions')

    -- local function browse_project_files(prompt_bufnr)
    --   local state = require("telescope.actions.state")
    --   local project = require("project_nvim.project")
    --
    --   local selected_entry = state.get_selected_entry()
    --   if selected_entry == nil then
    --     actions.close(prompt_bufnr)
    --   end
    --   local project_path = selected_entry.value
    --   actions.close(prompt_bufnr)
    --
    --   local cd_successful = project.set_pwd(project_path, "telescope")
    --
    --   local opt = {
    --     cwd = project_path,
    --     hidden = false,
    --   }
    --
    --   if cd_successful then
    --     require("telescope").extensions.file_browser.file_browser(opt)
    --   end
    -- end

    telescope.setup {
      defaults = {
        layout_strategy = 'vertical',
        -- layout_config = {
        --   vertical = { width = 0.5 },
        -- },
        path_display = { 'truncate ' },
        -- initial_mode = "normal",
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            -- remap to going to home directory
            ['<C-h>'] = fb_actions.goto_home_dir,
            -- ["<C-b>"] = ),
          },
          n = {
            -- b = function(prompt_bufnr)
            --   browse_project_files(prompt_bufnr)
            -- end,
            ['q'] = actions.close,
          },
        },
      },
      extensions = {
        file_browser = {
          cwd_to_path = true,
          -- hide_parent_dir = true,
        },
      },
    }

    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')
    telescope.load_extension('projects')

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>fff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' })
    keymap.set('n', '<leader>ffr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
    keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find string in cwd' })
    keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })
    -- keymap.set(
    --   "n",
    --   "<leader>fb",
    --   "<cmd>Telescope file_browser<CR>",
    --   { desc = "Open Telescope file browser", noremap = true }
    -- )
    keymap.set(
      'n',
      '<leader>fF',
      ':lua require("telescope._extensions.file_browser.actions").open()<cr>',
      { desc = 'Open in Finder', noremap = true }
    )

    -- -- open file_browser with the path of the current buffer
    -- vim.api.nvim_set_keymap(
    --   "n",
    --   "<space>fb",
    --   ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    --   { noremap = true }
    -- )
  end,
}
