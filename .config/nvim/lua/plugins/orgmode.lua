return {
  "nvim-orgmode/orgmode",
  dependencies = {
    -- Treesitter configuration
    { "nvim-treesitter/nvim-treesitter" },
  },

  config = function()
    require("orgmode").setup_ts_grammar()
    require("orgmode").setup({
      org_agenda_files = {
        "~/org/*",
        "/Users/struppi/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/*",
      },
      org_default_notes_file = "/Users/struppi/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/braindump.org",
      mappings = {
        org = {
          org_timestamp_up = "+",
          org_timestamp_down = "-",
          org_do_promote = "<<s",
          org_do_demote = ">>s",
        },
      },
      org_capture_templates = {
        t = {

          description = "Task",
          template = "* TODO %?\n%U",
          target = "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/refile.org",
        },
        T = {
          description = "Schedule today",
          template = "* TODO %?\nSCHEDULED : <%<%Y-%m-%d %a>>",
          target = "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org",
        },
        D = {
          description = "Dump clipboard",
          template = "*** %x\n %U",
          target = "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/braindump.org",
        },
        {
          e = "Event",
          er = {
            description = "recurring",
            template = "** %?\n %T",
            target = "~/org/calendar.org",
            headline = "recurring",
          },
          eo = {
            description = "one-time",
            template = "** %?\n %T",
            target = "~/org/calendar.org",
            headline = "one-time",
          },
        },
      },
    })
  end,

  opts = {},
}
