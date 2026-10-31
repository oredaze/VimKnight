local o = vim.opt

------------------------
-- Neovim Basic Settings
------------------------
o.mouse = "a"
o.mousescroll = "ver:10,hor:5"
o.title = true
o.titlestring = "%t - nVim"
o.titleold = "\27]0;\7"
o.number = true
o.relativenumber = true
o.signcolumn = "number" -- auto, number, yes, no
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
o.shada = "%,\"35,'10,f1,<32,:30,/10,h"
o.fillchars = { vert = "│", diff = "╱", fold = "-" }
o.completeopt = "menuone,noselect"
o.showmode = false
o.showtabline = 0
o.laststatus = 3
o.showbreak = "└→"
o.list = true
o.ruler = false
o.foldopen:remove('hor')
o.listchars:append("tab:│ ")
o.listchars:append("trail:-")

-- single, rounded, shadow, solid or a table
-- neovim_borders = "rounded"
neovim_borders = { "+", "-", "+", "|", "+", "-", "+", "|" }

-- Indents
o.tabstop = 4 -- default number of characters for indents
o.shiftwidth = 0
o.expandtab = true -- default indent type; true for spaces

vim.g.markdown_folding = 1

vim.diagnostic.config({
    -- signs = false,
    signs = { text = {
        [vim.diagnostic.severity.ERROR] = '󱇫',
        [vim.diagnostic.severity.WARN] = '',
        [vim.diagnostic.severity.INFO] = '',
        [vim.diagnostic.severity.HINT] = '',
    } },
    virtual_text = false,
    -- virtual_text = {
    --     prefix = "",
    --     spacing = 1,
    -- },
    float = { border = neovim_borders },
})

if vim.g.neovide then
    vim.keymap.set({"n", "v", "i", "t"}, "<A-esc>", "<C-\\><C-n>")
    vim.keymap.set({"n", "v"}, "<C-z>", "<cmd>term<cr>", { silent = true })
    vim.keymap.set({"n", "v", "i", "t"}, "<A-CR>", "<cmd>term<CR>", { silent = true })
    vim.keymap.set({"n", "v", "i", "t"}, "<A-Tab>", "<C-\\><C-n><C-^>")
    vim.keymap.set({"n", "v", "i", "t"}, "<A-q>", "<cmd>bd!<CR>", { silent = true })
    vim.keymap.set({"n", "v", "i", "t"}, "<A-w>", "<C-\\><C-n><C-w>")
    vim.keymap.set({"n", "v", "i", "t"}, "<A-h>", "<C-\\><C-n><C-w>h")
    vim.keymap.set({"n", "v", "i", "t"}, "<A-j>", "<C-\\><C-n><C-w>j")
    vim.keymap.set({"n", "v", "i", "t"}, "<A-k>", "<C-\\><C-n><C-w>k")
    vim.keymap.set({"n", "v", "i", "t"}, "<A-l>", "<C-\\><C-n><C-w>l")
    vim.o.guifont = "Code New Roman,NerdSymbola:h14:#h-slight:#e-subpixelantialias"
    vim.g.neovide_pixel_geometry = "RGBH" -- Check your monitor
    vim.g.neovide_text_gamma = 0.5
    vim.g.neovide_text_contrast = 0.1
    vim.o.linespace = -1
    -- Other
    vim.g.neovide_progress_bar_enabled = false
    -- vim.g.neovide_normal_opacity = 0.98
    vim.g.neovide_scroll_animation_length = 0.05
    vim.g.neovide_cursor_animation_length = 0.1
end
