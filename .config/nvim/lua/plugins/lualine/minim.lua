-- ~  minim

-- ~  --------------------------------------------------------------------------------  ~ --

-- ~  Init

theme = require("plugins.lualine.colors.kanagawa.theme")
palette = require("plugins.lualine.colors.kanagawa.palette")

local has_devicons, devicons = pcall(require, "nvim-web-devicons")
local static = {}

-- ~  --------------------------------------------------------------------------------  ~ --

-- ~  Helpers

local custom_icons = {
    mode = "ʕ·ᴥ·ʔ",
    git_branch = "",
    error = " ",
    warn = " ",
    info = " ",
    hint = " ",
    added = " ",
    modified = "󰝤 ",
    modified_simple = "~ ",
    removed = " ",
    lock = "[-]",
    touched = "[*]"
}

local get_ftype_icon = function()
    local full_filename = vim.api.nvim_buf_get_name(0)
    local filename = vim.fn.fnamemodify(full_filename, ":t")
    local extension = vim.fn.fnamemodify(filename, ":e")
    static.ftype_icon, static.ftype_icon_color = devicons.get_icon_color(filename, extension, { default = true })
    -- return static.ftype_icon and static.ftype_icon .. ""
    return ""
end

local condition = {
    is_buf_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
    is_git_repo = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local mode_colors = {
    n      = palette.dragonRed,
    no     = palette.dragonRed,
    cv     = palette.dragonRed,
    ce     = palette.dragonRed,
    ["!"]  = palette.dragonRed,
    t      = palette.dragonRed,
    i      = palette.dragonGreen,
    v      = palette.dragonBlue,
    [""]  = palette.dragonBlue,
    V      = palette.dragonBlue,
    c      = palette.dragonAqua,
    s      = palette.dragonOrange,
    S      = palette.dragonOrange,
    [""]  = palette.dragonOrange,
    ic     = palette.dragonYellow,
    R      = palette.dragonViolet,
    Rv     = palette.dragonViolet,
    r      = palette.dragonTeal,
    rm     = palette.dragonTeal,
    ["r?"] = palette.dragonTeal,
}

-- ~  --------------------------------------------------------------------------------  ~ --

-- ~  Config

local config = {
    options = {
        component_separators = "",
        section_separators = "",
        always_divide_middle = true,
        theme = {
            normal = { c = { fg = theme.ui.fg_dim, bg = theme.ui.bg } },
            inactive = { c = { fg = theme.ui.fg_dim, bg = theme.ui.bg } },
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = { {
            "filename",
            path = 1
        } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}

local status_c = function(component) table.insert(config.sections.lualine_c, component) end
local status_x = function(component) table.insert(config.sections.lualine_x, component) end

-- ~  --------------------------------------------------------------------------------  ~ --

-- ~  Status line
-- ~  Left

status_c({
    "filename",
    cond = condition.is_buf_empty,
    path = 0,
    -- color = { fg = palette.dragonAqua },
    symbols = {
        modified = custom_icons.touched,
        readonly = custom_icons.lock,
        unnamed = "[No Name]",
        newfile = "[New]"
    }
})

-- ~  --------------------------------------------------------------------------------  ~ --
-- ~  Mid

status_c({ function() return "%=" end })

-- ~  --------------------------------------------------------------------------------  ~ --
-- ~  Right


status_x({
    "diff",
    cond = condition.is_git_repo,
    source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
        end
    end,
    symbols = {
        added = custom_icons.added,
        modified = custom_icons.modified_simple,
        removed = custom_icons.removed
    },
    colored = true,
    diff_color = {
        added = { fg = theme.vcs.added },
        modified = { fg = theme.vcs.changed },
        removed = { fg = theme.vcs.removed }
    }
})

status_x({
    "diagnostics",
    sources = { "nvim_lsp", "nvim_diagnostic" },
    symbols = {
        error = custom_icons.error,
        warn = custom_icons.warn,
        info = custom_icons.info,
        hint = custom_icons.hint
    },
    diagnostics_color = {
        error = { fg = theme.diag.error },
        warn = { fg = theme.diag.warning },
        info = { fg = theme.diag.info },
        hint = { fg = theme.diag.hint }
    }
})

status_x({ "branch", icon = custom_icons.git_branch, color = { fg = theme.special } })

status_x({
    -- Colored mode icon
    -- function() return custom_icons.mode end,
    function() return vim.fn.mode() end,
    color = function() return { fg = mode_colors[vim.fn.mode()] } end,
    padding = { right = 0 },
})

status_x({ "progress", color = { fg = theme.special } })

-- ~  --------------------------------------------------------------------------------  ~ --

return config
