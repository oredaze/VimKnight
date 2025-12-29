local map = vim.keymap.set
local cmap = vim.api.nvim_create_user_command

------------------------
-- Neovim Hotkeys
------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "|"

-- Misc
vim.cmd("cabbrev W w") -- For accidental W press
map("n", "<C-s>", ":w<CR>")
map("n", "<C-q>", "q")
map("n", "q", ":q<CR>")
map("n", "x", '"_x')
map("v", "p", '"_dP')
map("n", "y%", "ggVGy<C-o>", { desc = "Yank whole file" })
map("v", "y", "ygv<Esc>") -- Do not move cursor after visual yanking
map("v", ".", ":norm.<CR>") -- Dot enhancement in visual mode
map("n", "<Backspace>", ":noh<CR>", { silent = true })
map("n", "cd", ":cd %:h<CR>", { silent = true, desc = "cd %:h" })
map("n", "[d", "[c", { desc = "Prev diff" })
map("n", "]d", "]c", { desc = "Next Diff" })
map("n", "[c", "g;", { desc = "Older changes" })
map("n", "]c", "g,", { desc = "Newer changes" })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true })

-- Commenting
map("n", "<leader>c", ":norm gcc<CR>", { silent = true, desc = "Comment line" })
map("n", "<leader>C", ":norm vipgc<CR>", { silent = true, desc = "Comment paragraph" })
map("v", "<leader>", "gc", { silent = true, remap = true })

-- Helix-like
map({ "n", "v", "o" }, "gh", "0")
map({ "n", "v", "o" }, "gl", "$")

-- Fix tab
map("n", "<C-i>", "<C-i>")

-- Windows, tabs & buffers
map("n", "<C-w>t", ":tabnew<CR>", { silent = true })
map("n", "<C-w>d", ":bd<CR>")
map("n", "<Tab>", "<C-^>")
map("n", "gm", ":bm<CR>", { silent = true, desc = "Go to modified buffer" })
map("n", "gb", "<CMD>bprev<CR>", { silent = true, desc = "Go to prev buffer" })
map("n", "gn", "<CMD>bnext<CR>", { silent = true, desc = "Go to next buffer" })

-- External clipboard
map("!", "<C-v>", "<cmd>set paste<CR><C-r>+<cmd>set nopaste<CR>")
map("v", "<C-c>", '"+y')

-- Insert and command mode
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
    nnoremap <silent> go :call BigO()<CR>
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
map("n", "<leader>os", "<Esc>:set spell!<CR>", { desc = "Spell checking" })

-- Toggle colorcolumn
map("n", "<leader>ov", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.cc._value == "" then
        vim.opt.cc = "81"
    else
        vim.opt.cc = ""
    end
end, { desc = "Vertical guide" })

-- Toggle numbers
map("n", "<leader>on", function()
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
map("n", "<leader>ol", function()
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
map("n", "<leader>oc", function()
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
map("n", "<leader>ox", function()
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
map("n", "<leader>ow", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.list._value == true then
        vim.opt.list = false
    else
        vim.opt.list = true
    end
end, { desc = "Whitespace chars" })

-- Diff toggle
map("n", "<leader>od", function()
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

-- Colors toggle
map("n", "<leader>og", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.termguicolors._value == false then
        vim.opt.termguicolors = true
    else
        vim.opt.termguicolors = false
    end
end, { desc = "Guicolors" })

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
map("n", "<leader>l", "<cmd>Lf<CR>")
map("n", "<leader>b", "<cmd>Broot<CR>")
map("n", "\\", "<cmd>execute 'Oil' getcwd()<CR>")
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>")
cmap("E", "Oil", { nargs = "?" })
cmap("S", "belowright split | Oil", { nargs = "?" })
cmap("V", "rightbelow vsplit | Oil", { nargs = "?" })
cmap("T", "tabedit % | Oil", { nargs = "?" })

-- Fzf-lua
map("n", "<leader>f", ":FzfLua files<CR>", { silent = true, desc = "Files" })
map("n", "<leader>g", ":FzfLua live_grep<CR>", { silent = true, desc = "Grep" })
map("n", "<leader><Tab>", ":FzfLua buffers<CR>", { silent = true, desc = "Buffers" })
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
map("n", "?", ":FzfLua keymaps<CR>", { silent = true, desc = "Hotkeys" })
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

-- Trailblazer
map("n", "tt", ":TrailBlazerNewTrailMark<CR>", { desc = "Leave new trail" })
map("n", "tb", ":TrailBlazerTrackBack<CR>", { desc = "Blaze back the trail" })
map("n", "tn", ":TrailBlazerMoveToNearest<CR>", { desc = "Nearest trail" })
map("n", "tk", ":TrailBlazerPeekMovePreviousUp<CR>", { desc = "Move up the stack" })
map("n", "tj", ":TrailBlazerPeekMoveNextDown<CR>", { desc = "Move down the stack" })
map("n", "ta", ":TrailBlazerAddTrailMarkStack<CR>", { desc = "Add stack" })
map("n", "td", ":TrailBlazerDeleteTrailMarkStack<CR>", { desc = "Delete stack" })
map("n", "tD", ":TrailBlazerDeleteAllTrailMarks<CR>", { desc = "Delete all stacks" })
map("n", "tp", ":TrailBlazerPasteAtLastTrailMark<CR>", { desc = "Paste at trail" })
map("n", "tP", ":TrailBlazerPasteAtAllTrailMarks<CR>", { desc = "Paste at all" })
map("n", "t[", ":TrailBlazerSwitch_to_previous_trail_mark_stack<CR>", { desc = "Prev stack" })
map("n", "t]", ":TrailBlazerSwitch_to_next_trail_mark_stack<CR>", { desc = "Next stack" })
map("n", "ts", ":TrailBlazerSet_trail_mark_stack_sort_mode<CR>", { desc = "Stack sort mode" })
map("n", "tl", ":TrailBlazerOpenTrailMarkList<CR>", { desc = "Trails List" })
-- More at:
-- ~/.config/nvim/lua/plugins/trailblazer.lua

-- LSP
map("n", "<leader>Ld", "<cmd>LspStop<CR>", { desc = "Disable the LSP" })
map("n", "<leader>Le", "<cmd>LspStart<CR>", { desc = "Enable the LSP" })
map("n", "<leader>Lr", "<cmd>LspRestart<CR>", { desc = "Restart the LSP" })
-- More at:
-- ~/.config/nvim/lua/plugins/lsp.lua

-- Misc
map(
    { "n", "x" }, "gx", "<cmd>Browse<CR>",
    { noremap = true, silent = true, desc = "Open link/file" }
)
map("n", "<leader>ot", "<cmd>TransparentToggle<CR>", { desc = "Transparency" })
map("n", "J", ":TSJToggle<CR>")
map("n", "<leader>p", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>L", ":Lazygit<CR>", { desc = "Lazygit" })
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undotree" })
map("n", "<leader>n", "<cmd>Outline<CR>", { desc = "Nodes" })
vim.cmd("cabbrev z Z")

-- More at:
-- ~/.config/nvim/lua/plugins/heirline/main.lua  1 at line 53
-- ~/.config/nvim/lua/plugins/outline.lua
-- ~/.config/nvim/lua/plugins/oil.lua
-- ~/.config/nvim/lua/plugins/mini-files.lua
-- ~/.config/nvim/lua/plugins/mini-move.lua
