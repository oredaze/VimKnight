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
neovim_borders = "single"
-- neovim_borders = { "+", "-", "+", "|", "+", "-", "+", "|" }

-- Indents
o.tabstop = 4 -- default number of characters for indents
o.shiftwidth = 0
o.expandtab = true -- default indent type; true for spaces

vim.diagnostic.config({
    -- signs = false,
    virtual_text = false,
    -- virtual_text = {
    --     prefix = "",
    --     spacing = 1,
    -- },
    float = { border = neovim_borders },
})

if vim.g.neovide then
    vim.keymap.set({ "n", "v" }, "<C-z>", "<cmd>echo 'Disabled in neovide'<cr>")
    -- Font rendering
    vim.o.guifont = "monospace,NerdSymbola:h11:#e-subpixelantialias"
    vim.g.neovide_pixel_geometry = "RGBH" -- Check your monitor
    vim.g.neovide_text_gamma = 1.0
    vim.g.neovide_text_contrast = 0.1
    -- Other
    vim.g.neovide_normal_opacity = 0.98
    vim.g.neovide_scroll_animation_length = 0.1
    vim.g.neovide_cursor_animation_length = 0.1
end
