local utils = require("heirline.utils")
local get_hl = utils.get_highlight

local function setup_colors()
    return {
        red_sigil = "#CC2929",
        tabline_fg = get_hl("TabLine").fg,
        tablinesel_fg = get_hl("TabLineSel").fg,
        statusline_fg = get_hl("StatusLine").fg,
        tabline_bg = get_hl("TabLine").bg,
        tablinesel_bg = get_hl("TabLineSel").bg,
        statusline_bg = get_hl("StatusLine").bg,
        tablinefill = get_hl("TabLineFill").bg,
        miscgrey = get_hl("Comment").fg,
        dimgrey = get_hl("StatusLineNC").fg,
        readonly = get_hl("ErrorMsg").fg,
        filename = get_hl("TabLineSel").fg,
        modified = get_hl("Number").fg,
        workdir = get_hl("Tag").fg,
        filetype = get_hl("Type").fg,
        currentpath = get_hl("Directory").fg,
        macrorec = get_hl("Operator").fg,
        termin = get_hl("Function").fg,
        -- DapMessages = get_hl('Debug').fg,

        git_branch = get_hl("Title").fg,
        git_added = get_hl("GitSignsAdd").fg,
        git_deleted = get_hl("GitSignsDelete").fg,
        git_changed = get_hl("GitSignsChange").fg,

        spellindicator = get_hl("Function").fg,
        lspindicator = get_hl("SpecialKey").fg,
        lspserver = get_hl("SpecialKey").fg,

        diagerror = get_hl("DiagnosticSignError").fg,
        diagwarn = get_hl("DiagnosticSignWarn").fg,
        diaginfo = get_hl("DiagnosticSignInfo").fg,
        diaghint = get_hl("DiagnosticSignHint").fg,

        scrollbar = get_hl("CursorLineNr").fg,
        overflowsigil_fg = get_hl("CursorLineNr").fg,
        overflowsigil_bg = get_hl("TabLineFill").bg,
        searchresults = get_hl("Search").bg,
        cmd = get_hl("Statement").fg,
    }
end

-- Mode colors
do
    local mode_colors = {
        normal = get_hl("StatusLine").fg,
        insert = get_hl("Number").fg,
        visual = get_hl("Type").fg,
        visual_lines = get_hl("Type").fg,
        visual_block = get_hl("Type").fg,
        replace = get_hl("Exception").fg,
        v_replace = get_hl("Exception").fg,
        none = get_hl("Exception").fg,
        enter = get_hl("Function").fg,
        command = get_hl("Function").fg,
        shell = get_hl("Function").fg,
        term = get_hl("Function").fg,
        more = get_hl("Function").fg,
        op = get_hl("Special").fg,
        select = get_hl("Special").fg,
    }
    Mode = setmetatable({
        normal = { fg = "statusline_bg" },
    }, {
        __index = function(_, mode)
            return {
                fg = "statusline_bg",
                bg = mode_colors[mode],
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

lsp_colors = {
    lua_ls = "#4B8BB2",
    rust_analyzer = "#B26F48",
    marksman = "#B3CC8F",
}
