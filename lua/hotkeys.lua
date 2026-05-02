local map = vim.keymap.set
local cmap = vim.api.nvim_create_user_command

------------------------
-- Neovim Hotkeys
------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "|"

-- Misc
map("n", "<C-q>", "q") -- Move macro to prepare q key
map("n", "q", ":q<CR>")
map("n", "x", '"_x')
map("v", "p", '"_dP')
map("n", "y%", "ggVGy<C-o>", { desc = "Yank whole file" })
map("v", "y", "ygv<Esc>") -- Do not move cursor after visual yanking
map("n", "yap", "yap}", { desc = "Yank a paragraph" })
map("n", "yip", "yip}k", { desc = "Yank in paragraph" })
map("v", ".", ":norm.<CR>") -- Dot enhancement in visual mode
map("n", "<Backspace>", ":noh<CR>", { silent = true })
map("n", "cd", ":cd %:h<CR>", { silent = true, desc = "cd %:h" })
map("n", "[d", "[c", { desc = "Prev diff" })
map("n", "]d", "]c", { desc = "Next Diff" })
map("n", "[c", "g;", { desc = "Older changes" })
map("n", "]c", "g,", { desc = "Newer changes" })

-- Commenting
map("n", "<leader>c", ":norm gcc<CR>", { silent = true, desc = "Comment line" })
map("n", "<leader>C", ":norm vipgc<CR>", { silent = true, desc = "Comment paragraph" })
map("v", "<leader>", "gc", { silent = true, remap = true })

-- Fix tab
map("n", "<C-i>", "<C-i>")

-- Window management
map("n", "<Tab>", "<C-^>")
map("n", "<C-w>t", ":tabnew<cr>")
map("n", "gm", ":bm<CR>", { silent = true, desc = "Go to modified buffer" })
map({"n", "v", "i", "t"}, "<A-Tab>", "<C-\\><C-n><C-^>", { silent = true })
map({"n", "v", "i", "t"}, "<A-q>", "<C-\\><C-n><cmd>bd!<CR>", { silent = true })
map({"n", "v", "i", "t"}, "<A-c>", "<C-\\><C-n><C-w>c", { silent = true })
map({"n", "v", "i", "t"}, "<A-o>", "<C-\\><C-n><C-w>w", { silent = true })
map({"n", "v", "i", "t"}, "<A-j>", "<C-\\><C-n><C-w>j", { silent = true })
map({"n", "v", "i", "t"}, "<A-k>", "<C-\\><C-n><C-w>k", { silent = true })
map({"n", "v", "i", "t"}, "<A-h>", "<C-\\><C-n><C-w>h", { silent = true })
map({"n", "v", "i", "t"}, "<A-l>", "<C-\\><C-n><C-w>l", { silent = true })
map({"n", "v", "i", "t"}, "<A-C-k>", "<C-\\><C-n>5<C-w>+", { silent = true })
map({"n", "v", "i", "t"}, "<A-C-j>", "<C-\\><C-n>5<C-w>-", { silent = true })
map({"n", "v", "i", "t"}, "<A-C-h>", "<C-\\><C-n>5<C-w><", { silent = true })
map({"n", "v", "i", "t"}, "<A-C-l>", "<C-\\><C-n>5<C-w>>", { silent = true })
map({"n", "v", "i", "t"}, "<A-S-k>", "<C-\\><C-n><C-w>K", { silent = true })
map({"n", "v", "i", "t"}, "<A-S-j>", "<C-\\><C-n><C-w>J", { silent = true })
map({"n", "v", "i", "t"}, "<A-S-h>", "<C-\\><C-n><C-w>H", { silent = true })
map({"n", "v", "i", "t"}, "<A-S-l>", "<C-\\><C-n><C-w>L", { silent = true })
map({"n", "v", "i", "t"}, "<A-x>", "<C-\\><C-n><C-w>x", { silent = true })
map({"n", "v", "i", "t"}, "<A-s>", "<C-\\><C-n><cmd>sp +term<CR>", { silent = true })
map({"n", "v", "i", "t"}, "<A-v>", "<C-\\><C-n><cmd>vs +term<CR>", { silent = true })
map({"n", "v", "i", "t"}, "<A-t>", "<C-\\><C-n><cmd>tabnew +term<CR>", { silent = true })
map({"n", "v", "i", "t"}, "<A-cr>", "<C-\\><C-n><cmd>term<CR>", { silent = true })
map({"n", "v", "i", "t"}, "<A-,>", "<C-\\><C-n><cmd>bprevious<CR>", { silent = true })
map({"n", "v", "i", "t"}, "<A-.>", "<C-\\><C-n><cmd>bnext<CR>", { silent = true })
map({"n", "v", "i", "t"}, "<A-e>", "<C-\\><C-n><C-w>=", { silent = true })
map({"n", "v", "i", "t"}, "<A-z>", "<C-\\><C-n><C-w>_<C-w>|", { silent = true })
map({"n", "v", "i", "t"}, "<A-d>", "<C-\\><C-n><C-w>T", { silent = true })
map({"n", "v", "i", "t"}, "<A-`>", "<C-\\><C-n>g<Tab>", { silent = true })
map({"n", "v", "i", "t"}, "<A-1>", "<C-\\><C-n>1gt", { silent = true })
map({"n", "v", "i", "t"}, "<A-2>", "<C-\\><C-n>2gt", { silent = true })
map({"n", "v", "i", "t"}, "<A-3>", "<C-\\><C-n>3gt", { silent = true })
map({"n", "v", "i", "t"}, "<A-4>", "<C-\\><C-n>4gt", { silent = true })
map("t", "<A-esc>", "<C-\\><C-n>")
vim.api.nvim_create_autocmd("TermOpen", {
    command = 'tnoremap <esc> <C-\\><esc>',
})
-- ~/.config/nvim/lua/plugins/heirline/main.lua  1 at line 48

-- External clipboard
map("!", "<C-v>", "<cmd>set paste<CR><C-r>+<cmd>set nopaste<CR>")
map("v", "<C-c>", '"+y')

-- Insert and command mode
map("!", "<C-h>", "<C-Left>")
map("!", "<C-l>", "<C-Right>")
map("!", "<C-a>", "<Home>")
map("!", "<C-e>", "<End>")

-- Search literally
vim.cmd([[ vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR> ]]) -- * in visual mode
map("n", "*", "", {
    callback = function()
        vim.fn.execute("normal! *N")
    end,
})
map("n", "#", "", {
    callback = function()
        vim.fn.execute("normal! #N")
    end,
})

-- Open new spaced out lines
vim.cmd([[
    nnoremap <silent> zo :call BigO()<CR>
    function BigO ()
        if getline('.')[col('.')-1] == ''
            execute "normal! o\<cr>\<Up>"
            star
        else
            execute "normal! o\<cr>\<cr>\<Up>"
            star
        endif
    endfunction
]])

-- Cycle through colorschemes
vim.cmd([[
    let g:colors = getcompletion('', 'color')
    func! NextColors()
        let idx = index(g:colors, g:colors_name)
        return (idx + 1 >= len(g:colors) ? g:colors[0] : g:colors[idx + 1])
    endfunc
    func! PrevColors()
        let idx = index(g:colors, g:colors_name)
        return (idx - 1 < 0 ? g:colors[-1] : g:colors[idx - 1])
    endfunc
    nnoremap <F9> :exe "colo " .. PrevColors()<CR>
    nnoremap <F10> :exe "colo " .. NextColors()<CR>
]])

-- Get syntax groups under cursor
map("n", "g/", "<CMD>Inspect<CR>")
-- For treesitter
map("n", "g?", function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    print(vim.inspect(result))
end, { noremap = true, silent = false, desc = "Echo syntax group" })

------------------------
-- Options
------------------------
map("n", "zs", "<Esc>:set spell!<CR>", { desc = "Spell checking" })

-- Toggle colorcolumn
map("n", "z8", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.cc._value == "" then
        vim.opt.cc = "81"
    else
        vim.opt.cc = ""
    end
end, { desc = "80 char guide" })

map("n", "z9", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.cc._value == "" then
        vim.opt.cc = "91"
    else
        vim.opt.cc = ""
    end
end, { desc = "90 char guide" })

map("n", "z0", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.cc._value == "" then
        vim.opt.cc = "101"
    else
        vim.opt.cc = ""
    end
end, { desc = "100 char guide" })

-- Toggle numbers
map("n", "zn", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.nu._value == true then
        vim.opt.rnu = false
        vim.opt.nu = false
    else
        vim.opt.nu = true
        vim.opt.rnu = true
    end
end, { desc = "Numbers" })

-- Toggle line highlights
map("n", "zl", function()
    if
        ---@diagnostic disable-next-line: undefined-field
        vim.opt.cursorline._value == false
        ---@diagnostic disable-next-line: undefined-field
        or vim.opt.cursorlineopt._value == "number"
    then
        vim.opt.cursorlineopt = "both"
        vim.opt.cursorline = true
    else
        vim.opt.cursorline = false
        vim.opt.cursorlineopt = "number"
    end
end, { desc = "Line hightlight" })

-- Toggle column highlights
map("n", "zc", function()
    if
        ---@diagnostic disable-next-line: undefined-field
        vim.opt.cursorcolumn._value == false
    then
        vim.opt.cursorcolumn = true
    else
        vim.opt.cursorcolumn = false
    end
end, { desc = "Column hightlight" })

-- Toggle both line & column highlights
map("n", "zx", function()
    if
        ---@diagnostic disable-next-line: undefined-field
        vim.opt.cursorline._value == false
        ---@diagnostic disable-next-line: undefined-field
        or vim.opt.cursorcolumn._value == false
    then
        vim.opt.cursorlineopt = "both"
        vim.opt.cursorline = true
        vim.opt.cursorcolumn = true
    else
        vim.opt.cursorcolumn = false
        vim.opt.cursorline = false
        vim.opt.cursorlineopt = "number"
    end
end, { desc = "Cross hightlights" })

-- Toggle list
map("n", "z<Tab>", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.list._value == true then
        vim.opt.list = false
    else
        vim.opt.list = true
    end
end, { desc = "Whitespace chars" })

-- Diff toggle
map("n", "zD", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.diff._value == true then
        vim.opt.diff = false
        vim.opt.scrollbind = false
    else
        vim.cmd("wincmd =")
        vim.opt.diff = true
        vim.opt.scrollbind = true
        vim.cmd("wincmd w")
        vim.opt.diff = true
        vim.opt.scrollbind = true
        vim.cmd("wincmd w")
    end
end, { desc = "Diff toggle" })

------------------------
-- Plugin Hotkeys
------------------------

-- Subversive
map({ "n", "v" }, "r", "<Plug>(SubversiveSubstitute)")
map("n", "rr", "<Plug>(SubversiveSubstituteLine)")
map("n", "rs", "<Plug>(SubversiveSubstituteRange)")

map("n", "r*", "<Plug>(SubversiveSubstituteWordRange)")
map("n", "r%", "ggVG<Plug>(SubversiveSubstitute)")
map("v", "p", "<Plug>(SubversiveSubstitute)")

-- Pounce
map({ "n", "x", "o" }, "f", "<cmd>Pounce<cr>")

-- Mini.ai
map('n', 'S', 'cib', { remap = true })
map('n', 'g[', 'g[[', { remap = true })
map('n', 'g]', 'g]]', { remap = true })
map('n', 'g{', 'g[{', { remap = true })
map('n', 'g}', 'g]}', { remap = true })
map('n', 'g(', 'g[(', { remap = true })
map('n', 'g)', 'g])', { remap = true })

-- File explorers
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>")
map("n", "<leader>l", "<cmd>Lf<CR>")
map("n", "<leader>v", "<cmd>Vifm<CR>")
map("n", "<leader>b", "<cmd>Broot<CR>")
map("n", "<leader>o", "<cmd>execute 'Oil' getcwd()<CR>", { desc = "Oil" })
cmap("E", "Oil", { nargs = "?" })
cmap("S", "belowright split | Oil", { nargs = "?" })
cmap("V", "rightbelow vsplit | Oil", { nargs = "?" })
cmap("T", "tabedit % | Oil", { nargs = "?" })

-- Fzf-lua
map("n", "<leader>f", ":FzfLua files<CR>", { silent = true, desc = "Files" })
map("n", "<leader>g", ":FzfLua live_grep<CR>", { silent = true, desc = "Grep" })
map("n", "<leader>w", ":FzfLua buffers<CR>", { silent = true, desc = "Buffers" })
map("n", "<leader>j", ":FzfLua jumps<CR>", { silent = true, desc = "Jumps" })
map("n", "<leader>s", ":FzfLua lsp_document_symbols<CR>", { silent = true, desc = "Symbols" })
map("n", "<leader>S", ":FzfLua lsp_workspace_symbols<CR>", { silent = true, desc = "WS symbols" })
map("n", "<leader>d", ":FzfLua lsp_document_diagnostics<CR>", { silent = true, desc = "Diagnostics" })
map("n", "<leader>D", ":FzfLua lsp_workspace_diagnostics<CR>", { silent = true, desc = "Diagnostics" })
map("n", "<leader>;", ":FzfLua commands<CR>", { silent = true, desc = "Commands" })
map("n", "<leader>'", ":FzfLua registers<CR>", { silent = true, desc = "Registers" })
map("n", "<leader>/", ":FzfLua blines<CR>", { silent = true, desc = "Search" })
map("n", "<leader>a", ":FzfLua lines<CR>", { silent = true, desc = "Full search" })
map("n", "<leader>m", ":FzfLua marks<CR>", { silent = true, desc = "Marks" })
map("n", "<leader>r", ":FzfLua oldfiles<CR>", { silent = true, desc = "Recent" })
-- -- More at:
-- -- ~/.config/nvim/lua/plugins/fzf-lua.lua

-- Marks
map("n", "-", ":BookmarksQFListAll<CR>", { desc = "Number marks list" })
map("n", "]'", "<Plug>(Marks-next)zz", { desc = "Next mark" })
map("n", "['", "<Plug>(Marks-prev)zz", { desc = "Previous mark" })
map("n", "]`", "<Plug>(Marks-next)zz", { desc = "Next mark" })
map("n", "[`", "<Plug>(Marks-prev)zz", { desc = "Previous mark" })
-- More at:
-- ~/.config/nvim/lua/plugins/marks.lua

-- LSP
map("n", "<leader>Ld", "<cmd>lsp disable<CR>", { desc = "Disable the LSP" })
map("n", "<leader>Le", "<cmd>lsp enable<CR>", { desc = "Enable the LSP" })
map("n", "<leader>Lr", "<cmd>lsp restart<CR>", { desc = "Restart the LSP" })
-- More at:
-- ~/.config/nvim/lua/plugins/lsp.lua

-- Misc
map(
    { "n", "x" }, "gx", "<cmd>Browse<CR>",
    { noremap = true, silent = true, desc = "Open link/file" }
)
map("n", "<C-p>", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>G", ":Lazygit<CR>", { desc = "Lazygit" })
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undotree" })
vim.cmd("cabbrev z Z")

-- More at:
-- ~/.config/nvim/lua/plugins/oil.lua
-- ~/.config/nvim/lua/plugins/mini-files.lua
-- ~/.config/nvim/lua/plugins/mini-move.lua
