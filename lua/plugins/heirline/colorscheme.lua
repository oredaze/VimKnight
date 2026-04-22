local utils = require("heirline.utils")
local get_hl = utils.get_highlight

local function setup_colors()
    return {
        red_sigil = get_hl("Exception").fg,
        tabline_fg = get_hl("TabLine").fg,
        tablinesel_fg = get_hl("TabLineSel").fg,
        statusline_fg = get_hl("StatusLine").fg,
        tabline_bg = get_hl("TabLine").bg,
        tablinesel_bg = get_hl("TabLineSel").bg,
        statusline_bg = get_hl("StatusLine").bg,
        tablinefill = get_hl("StatusLine").bg,
        miscgrey = get_hl("Comment").fg,
        dimgrey = get_hl("StatusLineNC").fg,
        readonly = get_hl("ErrorMsg").fg,
        filename = get_hl("StatusLine").fg,
        modified = get_hl("Number").fg,
        workdir = get_hl("Tag").fg,
        currentpath = get_hl("Directory").fg,
        macrorec = get_hl("Statement").fg,
        -- DapMessages = get_hl('Debug').fg,
        git_branch = get_hl("PreProc").fg,
        git_added = get_hl("Added").fg,
        git_deleted = get_hl("Removed").fg,
        git_changed = get_hl("Changed").fg,
        spellindicator = get_hl("Function").fg,
        lspindicator = get_hl("SpecialKey").fg,
        lspserver = get_hl("SpecialKey").fg,
        diagerror = get_hl("DiagnosticError").fg,
        diagwarn = get_hl("DiagnosticWarn").fg,
        diaginfo = get_hl("DiagnosticInfo").fg,
        diaghint = get_hl("DiagnosticHint").fg,
        scrollbar = get_hl("CursorLineNr").fg,
        overflowsigil_fg = get_hl("CursorLineNr").fg,
        overflowsigil_bg = get_hl("StatusLine").bg,
        searchresults = get_hl("Search").bg,
        cmd = get_hl("Statement").fg,
    }
end

-- Mode colors
do
    local mode_colors = {
        normal = 7,
        insert = 4,
        visual = 3,
        visual_lines = 3,
        visual_block = 3,
        replace = 1,
        v_replace = 1,
        none = 1,
        enter = 2,
        command = 2,
        shell = 2,
        term = 2,
        more = 2,
        op = 5,
        select = 3,
    }
    Mode = setmetatable({
        normal = { ctermfg = 0 },
    }, {
        __index = function(_, mode)
            return {
                ctermfg = 0,
                ctermbg = mode_colors[mode],
                bold = true,
            }
        end,
    })
end

require("heirline").load_colors(setup_colors)
vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        utils.on_colorscheme(setup_colors)
    end,
    group = "Heirline",
})

-- --- @diagnostic disable-next-line
-- lsp_colors = {
--     lua_ls = "#4B8BB2",
--     rust_analyzer = "#B26F48",
--     marksman = "#B3CC8F",
-- }
