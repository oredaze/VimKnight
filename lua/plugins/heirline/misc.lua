local util = {}

util.icons = {
    -- ▐ ▌        ▒
    left_end = "",
    right_end = "",
    left_surround = "",
    right_surround = "",
    left_mode_sur = "",
    right_mode_sur = "",
    line_number = "",
    -- sbar = { "󰝦", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" },
    -- sbar = { "󰋙", "󰫃", "󰫄", "󰫅", "󰫆", "󰫇", "󰫈" },
    sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' },
    left_overflow = "",
    right_overflow = "",
    padlock = " 󰌾",
    circle = "󰌪", --   󰌪 
    circle_small = "", --  ◆
    circle_o = "", --  ◇
    modified = " 󰿶",
    spellcheck = "   ",
    terminal = "  ",
    macro_rec = "󰻃 ",
    bug = "󰨰 ",
    git_branch = " ",
    search = " ",
}

util.mode = setmetatable({
    n = "normal",
    no = "op",
    nov = "op",
    noV = "op",
    ["no"] = "op",
    niI = "normal",
    niR = "normal",
    niV = "normal",
    nt = "normal",
    v = "visual",
    V = "visual_lines",
    [""] = "visual_block",
    s = "select",
    S = "select",
    [""] = "block",
    i = "insert",
    ic = "insert",
    ix = "insert",
    R = "replace",
    Rc = "replace",
    Rv = "v_replace",
    Rx = "replace",
    c = "command",
    cv = "command",
    ce = "command",
    r = "enter",
    rm = "more",
    ["r?"] = "confirm",
    ["!"] = "shell",
    t = "terminal",
    ["null"] = "none",
}, {
    __call = function(self, raw_mode)
        return self[raw_mode]
    end,
})

util.mode_lable = {
    normal = "NORMAL",
    op = "OP",
    visual = "VISUAL",
    visual_lines = "V-LINES",
    visual_block = "V-BLOCK",
    select = "SELECT",
    block = "BLOCK",
    insert = "INSERT",
    replace = "REPLACE",
    v_replace = "V-REPLACE",
    command = "COMMAND",
    enter = "ENTER",
    more = "MORE",
    confirm = "CONFIRM",
    shell = "SHELL",
    terminal = "TERMINAL",
    none = "NONE",
}

return util
