local path = "~/Library/Mobile Documents/com~apple~CloudDocs/struppi-city"
local sympath = "~/Documents/vault/struppi-city"
-- local notebook = "~/Library/Mobile Documents/com~apple~CloudDocs/notebook"
local notebook = "~/Documents/vault/notebook"

return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    -- STRUPPI CITY
    "BufReadPre "
      .. vim.fn.expand(path)
      .. "/**/*.md",
    "BufNewFile " .. vim.fn.expand(path) .. "/**/*.md",
    "BufNewFile " .. vim.fn.expand(path) .. "/**.md",
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
      "<leader>von",
      ":e " .. vim.fn.expand(notebook) .. "<cr>",
      desc = "Open Notebook.",
    },

    {
      "<leader>vo1",
      ":e " .. sympath .. "/01 encounters <cr>",
      desc = "Open encounters.",
    },
    {
      "<leader>vo2",
      ":e " .. sympath .. "/02 notes <cr>",
      desc = "Open notes.",
    },
    {
      "<leader>vo3",
      ":e " .. sympath .. "/03 maps <cr>",
      desc = "Open maps.",
    },
    {
      "<leader>vo4",
      ":e " .. sympath .. "/04 diary <cr>",
      desc = "Open diary.",
    },
    {
      "<leader>vo5",
      ":e " .. sympath .. "/05 braindump <cr>",
      desc = "Open braindump.",
    },
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    dir = "~/Library/Mobile Documents/com~apple~CloudDocs/struppi-city", -- no need to call 'vim.fn.expand' here
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

    -- note_id_func = function(title)
    --   -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    --   -- In this case a note with the title 'My new note' will given an ID that looks
    --   -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    --   local suffix = ""
    --   if title ~= nil then
    --     -- If title is given, transform it into valid file name.
    --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    --   else
    --     -- If title is nil, just add 4 random uppercase letters to the suffix.
    --     for _ = 1, 4 do
    --       suffix = suffix .. string.char(math.random(65, 90))
    --     end
    --   end
    --   return tostring(os.time()) .. "-" .. suffix
    -- end,
  },
}
