local autocmd = vim.api.nvim_create_autocmd

------------------------
-- Neovim Autocmds
------------------------
-- No autocomment
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions = "jql"
    end,
})

-- Open a file from its last left off position
autocmd("BufReadPost", {
    callback = function()
        if
            not vim.fn.expand("%:p"):match(".git")
            and vim.fn.line("'\"") > 1
            and vim.fn.line("'\"") <= vim.fn.line("$")
        then
            vim.cmd("normal! g'\"")
        end
    end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 250 })
    end,
})

-- Relative numbers only in focused normal mode windows
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})
autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
    pattern = "*",
    group = augroup,
    callback = function()
        if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
            vim.opt.relativenumber = true
        end
    end,
})
autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
    pattern = "*",
    group = augroup,
    callback = function()
        if vim.o.nu then
            vim.opt.relativenumber = false
            -- vim.cmd("redraw")
        end
    end,
})

-- No auto comment on new lines
autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "r", "o" })
    end,
})

-- Mutt file type
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "/tmp/mutt*", vim.fn.expand("$HOME") .. "/tmp/mutt*" },
    callback = function()
        vim.opt.filetype = "mail"
        vim.opt.wm = "0"
        vim.opt.tw = "72"
        vim.opt.number = false
        vim.opt.digraph = true
        vim.opt.list = false
    end,
})

-- Auto-insert in the neovim terminal
autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
    callback = function(args)
        if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
            vim.cmd("startinsert")
        end
    end,
})

-- Disable list characters
autocmd("FileType", {
    pattern = { "log", "markdown", "org", "txt", "norg" },
    callback = function()
        vim.opt_local.list = false
    end,
})
