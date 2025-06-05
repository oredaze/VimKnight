local autocmd = vim.api.nvim_create_autocmd

------------------------
-- Neovim Autocmds
------------------------
-- Open help in a buffer
autocmd("BufWinEnter", {
    pattern = "*",
    callback = function(event)
        if vim.bo[event.buf].filetype == "help" then
            vim.bo.buflisted = true
            vim.opt_local.list = false
            vim.cmd.only()
        end
    end,
})

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
    pattern = { "log", "markdown", "txt" },
    callback = function()
        vim.opt_local.list = false
    end,
})

-- Markdown fill --- line with virtual text
local function add_virtual_dash_line()
    -- Get the current buffer
    local bufnr = vim.api.nvim_get_current_buf()

    -- Clear any existing extmarks in namespace
    local ns_id = vim.api.nvim_create_namespace("dash_overlay")
    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

    -- Iterate through all lines in the buffer
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for i, line in ipairs(lines) do
        if line == "---" then
            -- Add virtual text for a line of 80 '─' characters
            vim.api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, 0, {
                virt_text = { { string.rep("─", 80), "Conceal" } },
                virt_text_pos = "overlay",
                hl_mode = "combine", -- Use combine to merge highlight with text
            })
        end
    end
end

vim.api.nvim_create_autocmd({ "BufReadPost", "TextChanged", "TextChangedI" }, {
    pattern = "*.md",
    callback = add_virtual_dash_line,
})
