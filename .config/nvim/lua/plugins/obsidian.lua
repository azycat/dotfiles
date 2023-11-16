local citypath = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/struppi-city"
local sympath = "~/Documents/vault/struppi-city"
local notebook = "~/Documents/vault/notebook"

return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    -- STRUPPI CITY
    "BufReadPre "
      .. vim.fn.expand(citypath)
      .. "/**/*.md",
    "BufNewFile " .. vim.fn.expand(citypath) .. "/**/*.md",
    "BufNewFile " .. vim.fn.expand(citypath) .. "/**.md",
    -- NOTEBOOK
    "BufReadPre "
      .. vim.fn.expand(notebook)
      .. "/**/*.md",
    "BufNewFile " .. vim.fn.expand(notebook) .. "/**/*.md",
    "BufNewFile " .. vim.fn.expand(notebook) .. "/**.md",
  },
  keys = {
    {
      "<leader>vn",
      ":ObsidianNew 05 braindump/" .. tostring(os.date("%y%m%d%H%m")) .. ".md <cr>",
      desc = "Braindump a note with a unique ID",
    },
    {
      "<leader>vd",
      ":ObsidianToday <cr>",
      desc = "Open the daily note for today.",
    },
    {
      "<leader>vy",
      ":ObsidianYesterday <cr>",
      desc = "Open the daily note from the last weekday.",
    },
    {
      "<leader>vt",
      ":ObsidianTemplate <cr>",
      desc = "Insert a template.",
    },
    {
      "<leader>vit",
      -- { t = { "<cmd>pu='[" .. tostring(os.date("%T")) .. "]'<cr>", "Current Time" } },
      "<cmd>pu="
        -- .. tostring(os.date("%I:%m %p"))
        .. "strftime('<%I:%m %p>')"
        .. "<cr>",

      desc = "Insert time.",
    },
    {
      "<leader>vid",
      "<cmd>pu=strftime('<%Y-%m-%d>') <cr>",
      desc = "Insert date.",
    },

    {
      "<leader>von",
      ":Oil --float " .. vim.fn.expand(notebook) .. "<cr>",
      desc = "Open Notebook.",
    },

    {
      "<leader>vo1",
      ":Oil --float " .. sympath .. "/01\\ encounters <cr>",
      desc = "Open encounters.",
    },
    {
      "<leader>vo2",
      ":Oil --float " .. sympath .. "/02\\ notes <cr>",
      desc = "Open notes.",
    },
    {
      "<leader>vo3",
      ":Oil --float " .. sympath .. "/03\\ maps <cr>",
      desc = "Open maps.",
    },
    {
      "<leader>vo4",
      ":Oil --float " .. sympath .. "/04\\ diary <cr>",
      desc = "Open diary.",
    },
    {
      "<leader>vo5",
      ":Oil --float " .. sympath .. "/05\\ braindump <cr>",
      desc = "Open braindump.",
    },
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    dir = "~/Documents/vault/struppi-city", -- no need to call 'vim.fn.expand' here
    mappings = {
      -- ["gf"] = require("obsidian.mapping").gf_passthrough(),
    },

    templates = {
      subdir = "etc/_templates/",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    daily_notes = {
      folder = "04 diary/",
      alias_format = tostring(os.date("%Y-%m-%d")),
    },
    -- disable_frontmatter = true,

    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { title = note.aliases, tags = note.tags }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },
}
