local map = vim.keymap.set
local cmap = vim.api.nvim_create_user_command

------------------------
-- Neovim Hotkeys
------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Misc
map("n", "<C-q>", "q") -- Move macro to prepare q key
map("n", "q", ":q<CR>")
map("n", "x", '"_x')
map("v", "p", '"_dP')
map("n", "y%", "ggVGy<C-o>", { desc = "Yank whole file" })
map("n", "c%", "ggcG", { desc = "Change whole file" })
map("n", "d%", "ggdG", { desc = "Delete whole file" })
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
map("n", "cw", "ciw", { desc = "Change word" })
map("n", "cW", "ciW", { desc = "Change WORD" })
map("n", "cp", "cip", { desc = "Change paragraph" })
map("n", "dw", "daw", { desc = "Delete word" })
map("n", "dW", "diW", { desc = "Delete WORD" })
map("n", "dp", "dap", { desc = "Delete paragraph" })
map("n", "yw", "yiw", { desc = "Yank word" })
map("n", "yW", "yiW", { desc = "Yank Word" })
map("n", "yp", "yap}", { desc = "Yank paragraph" })

-- Helix-like
map({"n", "v" }, "gl", "$", { desc = "End of line" })
map({"n", "v" }, "gh", "0", { desc = "Start of line" })

-- Commenting
map("n", "<leader>c", ":norm gcc<CR>", { silent = true, desc = "Comment line" })
map("n", "<leader>C", ":norm vipgc<CR>", { silent = true, desc = "Comment paragraph" })
map("v", "<leader>c", "gc", { silent = true, remap = true })

-- Fix tab
map("n", "<C-i>", "<C-i>")

-- Window management
map("n", "gm", ":bm<CR>", { silent = true, desc = "Go to modified buffer" })
map({"n", "v"}, "<Tab>", "<C-^>")
map({"n", "v", "i", "t"}, "<C-Tab>", "<C-\\><C-n><C-^>")
map({"n", "v", "i", "t"}, "<C-w>", "<C-\\><C-n><C-w>")
map({"n", "v"}, "<C-w>,", "<cmd>bprev<CR>", { silent = true })
map({"n", "v"}, "<C-w>.", "<cmd>bnext<CR>", { silent = true })
map({"n", "v"}, "<C-w>q", "<cmd>bd!<CR>", { silent = true })
map({"n", "v"}, "<C-w>z", "<C-w>_<C-w>|", { silent = true })
map({"n", "v"}, "<C-w>d", "<C-w>T", { silent = true })
map({"n", "v"}, "<C-w>`", "g<Tab>", { silent = true })
map({"n", "v"}, "<C-w>1", "1gt", { silent = true })
map({"n", "v"}, "<C-w>2", "2gt", { silent = true })
map({"n", "v"}, "<C-w>3", "3gt", { silent = true })
map({"n", "v"}, "<C-w>4", "4gt", { silent = true })
map({"n", "v"}, "<C-w>5", "5gt", { silent = true })
-- Terminal stuff
map({"n", "v"}, "<C-w>s", "<cmd>sp +term<CR>", { silent = true })
map({"n", "v"}, "<C-w>v", "<cmd>vs +term<CR>", { silent = true })
map({"n", "v"}, "<C-w>t", "<cmd>tabnew +term<CR>", { silent = true })
map({"n", "v"}, "<C-w><cr>", "<cmd>term<CR>", { silent = true })
map({"n", "v", "i", "t"}, "<C-[>", "<C-\\><C-n>")
map({"n", "v", "i", "t"}, "<C-esc>", "<C-\\><C-n>")
vim.api.nvim_create_autocmd("TermOpen", {
    command = [[
        tnoremap <C-backspace> <C-w>
        tnoremap <esc> <esc>
    ]],
})
-- ~/.config/nvim/lua/plugins/heirline/main.lua  1 at line 48

-- External clipboard
map("!", "<C-v>", "<cmd>set paste<CR><C-r>+<cmd>set nopaste<CR>")
map("v", "<C-c>", '"+y')

-- Insert and command mode
map("!", "<C-a>", "<Hom>")
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
map("n", "rw", "riw", { remap = true })
map("n", "rW", "riW", { remap = true })
map("n", "rp", "rip", { remap = true })
map("n", "rq", "riq", { remap = true })
map("n", "rb", "rib", { remap = true })

-- Pounce
map({ "n", "x", "o" }, "f", "<cmd>Pounce<cr>")

-- Mini.ai
map('n', 'g[', 'g[[', { remap = true })
map('n', 'g]', 'g]]', { remap = true })
map('n', 'g{', 'g[{', { remap = true })
map('n', 'g}', 'g]}', { remap = true })
map('n', 'g(', 'g[(', { remap = true })
map('n', 'g)', 'g])', { remap = true })
map("n", "cq", "ciq", { remap = true, desc = "Change in quotes" })
map('n', 'cb', 'cib', { remap = true, desc = "Change in brackets" })
map("n", "dq", "diq", { remap = true, desc = "Delete in quotes" })
map("n", "yq", "yiq", { remap = true, desc = "Yank in quotes" })
map("n", "yb", "yib", { remap = true, desc = "Yank in brackets" })

-- File explorers
map("n", "<leader>t", "<cmd>Neotree toggle<CR>")
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>")
map("n", "<leader>v", "<cmd>Vifm<CR>")
map("n", "<leader>b", "<cmd>Broot<CR>")
map("n", "<leader>o", "<cmd>execute 'Oil' getcwd()<CR>", { desc = "Oil" })
cmap("E", "Neotree current", { nargs = "?" })
cmap("S", "belowright split | Neotree current", { nargs = "?" })
cmap("V", "rightbelow vsplit | Neotree current", { nargs = "?" })
cmap("T", "tabedit % | Neotree current", { nargs = "?" })

-- Fzf-lua
map("n", "<leader>f", ":FzfLua files<CR>", { silent = true, desc = "Files" })
map("n", "<leader>g", ":FzfLua live_grep<CR>", { silent = true, desc = "Grep" })
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
map("n", "<leader>ld", "<cmd>lsp disable<CR>", { desc = "Disable the LSP" })
map("n", "<leader>le", "<cmd>lsp enable<CR>", { desc = "Enable the LSP" })
map("n", "<leader>lr", "<cmd>lsp restart<CR>", { desc = "Restart the LSP" })
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
map("n", "<leader>z", ":ZenMode<CR>", { desc = "Zen mode", silent = true })
map("n", "<leader>w", "<cmd>Neotree toggle buffers position=current<CR>")
vim.cmd("cabbrev z Z")

-- More at:
-- ~/.config/nvim/lua/plugins/oil.lua
-- ~/.config/nvim/lua/plugins/mini-files.lua
