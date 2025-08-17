local map = vim.keymap.set
local cmap = vim.api.nvim_create_user_command

------------------------
-- Neovim Hotkeys
------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "|"

-- Misc
vim.cmd("cabbrev W w") -- For accidental W press
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

-- Helix-like
map({ "n", "v", "o" }, "gh", "0")
map({ "n", "v", "o" }, "gl", "$")

-- Fix tab
map("n", "<C-i>", "<C-i>")

-- Windows, tabs & buffers
map("n", "<A-h>", "<C-w>h", { silent = true })
map("n", "<A-j>", "<C-w>j", { silent = true })
map("n", "<A-k>", "<C-w>k", { silent = true })
map("n", "<A-l>", "<C-w>l", { silent = true })
map("n", "<A-H>", "<C-w>H", { silent = true })
map("n", "<A-J>", "<C-w>J", { silent = true })
map("n", "<A-K>", "<C-w>K", { silent = true })
map("n", "<A-L>", "<C-w>L", { silent = true })
map("n", "<A-s>", "<C-w>s", { silent = true })
map("n", "<A-v>", "<C-w>v", { silent = true })
map("n", "<A-n>", "<C-w>n", { silent = true })
map("n", "<A-q>", "<C-w>c", { silent = true })
map("n", "<A-t>", ":tabnew<CR>", { silent = true })
map("n", "<A-T>", "<C-w>T", { silent = true })
map("n", "<A-o>", "<C-w>p", { silent = true })
map("n", "<A-=>", "<C-w>=", { silent = true })
map("n", "<Tab>", "<C-^>")
map("n", "gm", ":bm<CR>", { silent = true, desc = "Go to modified buffer" })
map("n", "gp", "<CMD>bprev<CR>", { silent = true })
map("n", "gn", "<CMD>bnext<CR>", { silent = true })

-- External clipboard
map("!", "<C-v>", "<cmd>set paste<CR><C-r>+<cmd>set nopaste<CR>")

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

-- Toggle column highlight
map("n", "<leader>oc", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.cc._value == "" then
        vim.opt.cc = "100"
    else
        vim.opt.cc = ""
    end
end, { desc = "Column highlight" })

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

-- Toggle line/column highlights
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

-- Matchup
map("x", "ib", "<plug>(matchup-i%)")
map("o", "ib", "<plug>(matchup-i%)")
map("x", "ab", "<plug>(matchup-a%)")
map("o", "ab", "<plug>(matchup-a%)")
map("n", "S", "c<plug>(matchup-i%)")

-- Pounce
map({ "n", "x", "o" }, "f", "<cmd>Pounce<cr>")

-- File explorers
map("n", "<space>l", "<cmd>Lf<CR>")
map("n", "<space>b", "<cmd>Broot<CR>")
map("n", "\\", "<cmd>execute 'Oil' getcwd()<CR>")
map("n", "<space>e", "<cmd>lua MiniFiles.open()<CR>")
cmap("E", "Oil", { nargs = "?" })
cmap("S", "belowright split | Oil", { nargs = "?" })
cmap("V", "rightbelow vsplit | Oil", { nargs = "?" })
cmap("T", "tabedit % | Oil", { nargs = "?" })

-- Telescope
map("n", "<space>f", "<cmd>Telescope find_files<CR>", { desc = "Files in cwd" })
map("n", "<space>g", "<cmd>Telescope live_grep<CR>", { desc = "Grep cwd" })
map("n", "<leader><Tab>", "<cmd>Telescope buffers<CR>", { desc = "Buffer picker" })
map(
    "n",
    "<space>/",
    "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    { desc = "Search current buffer" }
)
map("n", "<space>z", "<cmd>Telescope zoxide list<CR>", { desc = "Zoxide" })
map("n", "<space>j", "<cmd>Telescope jumplist<CR>", { desc = "Jumplist" })
map("n", "<space>s", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Doc symbols" })
map("n", "<space>S", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "WS symbols" })
map("n", "<space>d", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<space>;", "<cmd>Telescope command_history<CR>", { desc = "Command history" })
map("n", "<space>'", "<cmd>Telescope registers<CR>", { desc = "Registers" })
map("n", "?", ":Telescope keymaps<CR>", { desc = "Keymaps" })
-- More at:
-- ~/.config/nvim/lua/plugins/telescope.lua

-- Marks
map(
    "n",
    "<leader>m",
    ":MarksQFListAll<CR>:cclose<CR>:Trouble quickfix toggle<CR>",
    { desc = "Marks list" }
)
map(
    "n",
    "<leader>-",
    ":BookmarksQFListAll<CR>:cclose<CR>:Trouble quickfix toggle<CR>",
    { desc = "Number marks list" }
)
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
map(
    "n",
    "<leader>t",
    ":TrailBlazerOpenTrailMarkList<CR>:cclose<CR>:Trouble quickfix toggle<CR>",
    { desc = "Trails List" }
)
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
    { "n", "x" },
    "gx",
    "<cmd>Browse<CR>",
    { noremap = true, silent = true, desc = "Open link/file" }
)
map("n", "<leader>ot", "<cmd>TransparentToggle<CR>", { desc = "Transparency" })
map("n", "J", ":TSJToggle<CR>")
map("n", "<leader>p", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undotree" })
map("n", "<leader>n", "<cmd>Outline<CR>", { desc = "Nodes" })
map("n", "<leader>q", ":Trouble quickfix toggle<CR>", { desc = "Quickfix" })
map("n", "<leader>D", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics qf" })
map({"n", "i"}, "<a-cr>", "<cmd>ToggleTerm<CR>")

-- More at:
-- ~/.config/nvim/lua/plugins/trouble.lua
-- ~/.config/nvim/lua/plugins/comment.lua
-- ~/.config/nvim/lua/plugins/heirline/main.lua  1 at line 53
-- ~/.config/nvim/lua/plugins/outline.lua
-- ~/.config/nvim/lua/plugins/oil.lua
-- ~/.config/nvim/lua/plugins/mini-files.lua
-- ~/.config/nvim/lua/plugins/mini-move.lua
