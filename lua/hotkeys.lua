local map = vim.keymap.set
local cmap = vim.api.nvim_create_user_command

------------------------
-- Neovim Hotkeys
------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "|"

-- Misc
vim.cmd("cabbrev <expr> h (getcmdtype() == ':') ? 'tab help' : 'h'")
vim.cmd("cabbrev W w") -- For accidental W press
map("n", "<C-q>", "q")
map("n", "q", ":q<CR>")
map("n", "y%", "ggVGy<C-o>", { desc = "Yank whole file" })
map("v", "y", "ygv<Esc>") -- Do not move cursor after visual yanking
map("v", ".", ":norm.<CR>") -- Dot enhancement in visual mode
map("n", "<Backspace>", ":noh<CR>", { silent = true })
map("n", "cd", ":cd %:h<CR>", { silent = true, desc = "cd %:h" })

-- Fix tab
map("n", "<C-i>", "<C-i>")

-- Windows, tabs & buffers
map("n", "<C-w>d", ":bd<CR>", { silent = true, desc = "Delete buffer" })
map("n", "<C-w>,", "<CMD>bprev<CR>", { silent = true })
map("n", "<C-w>.", "<CMD>bnext<CR>", { silent = true })
map("n", "<C-w>t", ":tabnew<CR>", { silent = true, desc = "New tab" })
map("n", "<Tab>", "<C-^>")
map("n", "gm", ":bm<CR>", { silent = true, desc = "Go to modified buffer" })

-- Copy, Cut & Paste from/to external clipboard
map("v", "<C-c>", '"+y')
map("v", "<C-x>", '"+x')
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

map("n", "g?", ":echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>",
    { desc = "Echo syntax group" }
)

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

-- Move
map("n", "<C-j>", ":MoveLine(1)<CR>", { noremap = true, silent = true })
map("n", "<C-k>", ":MoveLine(-1)<CR>", { noremap = true, silent = true })

map("v", "<C-j>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })
map("v", "<C-k>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })

-- Pounce
map({ "n", "x", "o" }, "f", "<cmd>Pounce<cr>")

-- File explorers
map("n", "<C-l>", "<cmd>Lf<CR>")
map("n", "<C-b>", "<cmd>Broot<CR>")
map("n", "\\", "<cmd>execute 'Oil' getcwd()<CR>")
map("n", "<C-e>", "<cmd>lua MiniFiles.open()<CR>")
map("n", "<C-t>", "<cmd>Neotree toggle<CR>", { desc = "File tree" })
cmap("E", "Neotree current", { nargs = "?" })
cmap("S", "belowright split | Neotree current", { nargs = "?" })
cmap("V", "rightbelow vsplit | Neotree current", { nargs = "?" })
cmap("T", "tabedit % | Neotree current", { nargs = "?" })

-- Telescope
map("n", "<C-f>", "<cmd>Telescope find_files<CR>", { desc = "Files in cwd" })
map("n", "<C-g>", "<cmd>Telescope live_grep<CR>", { desc = "Grep CWD" })
map("n", "<leader><Tab>", "<cmd>Telescope buffers<CR>", { desc = "Buffer picker" })
map("n", "<C-s>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search current buffer" })
map("n", "<space>z", "<cmd>Telescope zoxide list<CR>", { desc = "Zoxide" })
map("n", "?", ":Telescope keymaps<CR>")
-- More at:
-- ~/.config/nvim/lua/plugins/telescope.lua

-- Marks
map("n", "<leader>m", ":MarksQFListAll<CR>:cclose<CR>:Trouble quickfix toggle<CR>", { desc = "Marks list" })
map("n", "<leader>M", ":BookmarksQFListAll<CR>:cclose<CR>:Trouble quickfix toggle<CR>", { desc = "Number marks list" })
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
map("n", "tl", ":TrailBlazerOpenTrailMarkList<CR>:cclose<CR>:Trouble quickfix toggle<CR>", { desc = "List" })
-- More at:
-- ~/.config/nvim/lua/plugins/trailblazer.lua

-- LSP
map("n", "<leader>ld", "<cmd>LspStop<CR>", { desc = "Disable the LSP" })
map("n", "<leader>le", "<cmd>LspStart<CR>", { desc = "Enable the LSP" })
map("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Restart the LSP" })
-- More at:
-- ~/.config/nvim/lua/plugins/lsp.lua

-- Misc
map({ "n", "x" }, "gx", "<cmd>Browse<CR>", { noremap = true, silent = true, desc = "Open link/file" })
map("n", "<leader>ot", "<cmd>TransparentToggle<CR>", { desc = "Transparency" })
map("n", "J", ":TSJToggle<CR>")
map("n", "<leader>p", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undotree" })
map("n", "<leader>q", ":Trouble quickfix toggle<CR>", { desc = "Quickfix" })
map("n", "<leader>n", "<cmd>Outline<CR>", { desc = "Nodes" })
map("n", "<leader>d", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })

-- More at:
-- ~/.config/nvim/lua/plugins/trouble.lua
-- ~/.config/nvim/lua/plugins/comment.lua
-- ~/.config/nvim/lua/plugins/heirline/main.lua  1 at line 53
-- ~/.config/nvim/lua/plugins/outline.lua
-- ~/.config/nvim/lua/plugins/neo-tree.lua
-- ~/.config/nvim/lua/plugins/oil.lua
-- ~/.config/nvim/lua/plugins/mini-files.lua
