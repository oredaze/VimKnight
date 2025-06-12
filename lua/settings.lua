local o = vim.opt

------------------------
-- Neovim Basic Settings
------------------------
local function smart_colors()
    local display = os.getenv("DISPLAY")
    local w_display = os.getenv("WAYLAND_DISPLAY")

    if display or w_display then
        o.termguicolors = true
        vim.cmd([[colorscheme moksha]])
    else
        o.termguicolors = false
        vim.cmd([[colorscheme 16monkeys]])
    end
end
smart_colors()

o.mouse = "a"
o.mousescroll = "ver:10,hor:5"
o.title = true
o.titlestring = "%t [nVim]"
o.titleold = "\27]0;\7"
o.number = false
o.relativenumber = false
o.signcolumn = "yes" -- auto, number, yes, no
o.ignorecase = true
o.smartcase = true
o.timeout = false
o.ttimeoutlen = 0
o.showmatch = true
o.matchtime = 0
o.splitbelow = true
o.splitright = true
o.spelllang = "en"
o.spellfile = "misc/spellfile.add"
o.updatetime = 250 -- Interval for writing swap, also used by gitsigns
o.confirm = true
o.cursorline = true
o.cursorlineopt = "number" -- number, both
o.iskeyword:append("-")
o.clipboard:append("unnamedplus")
-- o.shell = "/bin/zsh"
o.shada = "%,\"35,'10,f1,<32,:30,/10,h"
o.fillchars = { vert = "│", diff = "╱", fold = "-" }
o.completeopt = "menuone,noselect"
o.showmode = false
o.showtabline = 0
o.laststatus = 3
o.showbreak = "└→"
o.list = true
o.ruler = false
o.listchars:append("tab:│ ")
o.listchars:append("trail:-")

vim.fn.matchadd('ColorColumn', '\\%81v', 81)

-- Indents
o.tabstop = 4 -- default number of characters for indents
o.shiftwidth = 0
o.expandtab = true -- default indent type; true for spaces

-- Splits
o.fillchars:append({
    horiz = "─",
    horizup = "┴",
    horizdown = "┬",
    vert = "│",
    vertleft = "┤",
    vertright = "├",
    verthoriz = "┼",
})

-- Diagnostics
vim.fn.sign_define("DiagnosticSignError", { text = "󰨰 ", texthl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󱩎 ", texthl = "DiagnosticHint" })
vim.diagnostic.config({
    signs = false,
    virtual_text = {
        prefix = "",
        spacing = 1,
    },
})

-- -- Try this later when plugins and stuff chatch up:
-- vim.diagnostic.config({
--     signs = {
--         --support diagnostic severity / diagnostic type name
--         text = { [1] = 'e', ['ERROR'] = '󰨰', ['WARN'] = '', ['INFO'] = '', ['HINT'] = '󱩎' },
--     },
--     virtual_text = {
--         prefix = "",
--         spacing = 1,
--     },
-- })
