local orgpath = '~/Documents/vault/org'

return {
  'nvim-orgmode/orgmode',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
  },
  event = 'VeryLazy',
  opts = function()
    -- open windows in a new tab if dashboard is open
    local select_window_split = function(bufname)
      if bufname == nil or bufname == '' or bufname == '/Starter' then
        return 'tabnew'
      else
        return 'horizontal'
      end
    end
    local bufname = vim.api.nvim_buf_get_name(0)
    local split_mode = select_window_split(bufname)
    return {
      org_agenda_files = {
        vim.fn.expand(orgpath) .. '/todo.org',
        vim.fn.expand(orgpath) .. '/archive/todo.org_archive',
        vim.fn.expand(orgpath) .. '/calendar.org',
        vim.fn.expand(orgpath) .. '/inbox.org',
      },

      -- -- settings
      org_default_notes_file = vim.fn.expand(orgpath) .. '/inbox.org',
      org_deadline_warning_days = 5,
      org_archive_location = 'archive/%s_archive::',
      org_indent_mode = 'noindent',
      org_todo_keywords = { 'TODO', 'SCHEDULED', '|', 'DONE', 'KILL(k)' },
      win_split_mode = split_mode,

      mappings = {
        org = {
          org_timestamp_up = '+',
          org_timestamp_down = '-',
          org_do_promote = '<<s',
          org_do_demote = '>>s',
        },
        capture = {
          org_capture_finalize = ':w<cr>',
          org_capture_kill = 'q',
        },
      },

      -- templates
      org_capture_templates = {
        T = {
          description = 'Task',
          template = '* TODO %?\n',
          target = vim.fn.expand(orgpath) .. '/inbox.org',
        },
        t = {
          description = 'Schedule Today',
          template = '* TODO %?\nSCHEDULED: <%<%Y-%m-%d %a>>',
          target = orgpath .. '/todo.org',
        },
        i = {

          description = 'idea',
          template = '* IDEA %?\n',
          target = orgpath .. '/braindump.org',
        },
        d = {
          description = 'Dump clipboard',
          template = '* Pasted: %?\n%x\n %U',
          target = orgpath .. '/braindump.org',
        },
      },
    }
  end,
  config = function(_, opts)
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup(opts)

    -- testing
    -- require('orgmode').setup {
    --   org_agenda_files = {
    --     vim.fn.expand(orgpath) .. '/todo.org',
    --   },
    --   -- settings
    --   org_default_notes_file = vim.fn.expand(orgpath) .. '/inbox.org',
    --
    --     win_split_mode = 'tabnew'
    -- }
  end,
}
