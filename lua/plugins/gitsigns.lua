return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "▏" },
                    change = { text = "▏" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                -- signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                -- numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
                -- linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    follow_files = true,
                },
                -- auto_attach = true,
                -- attach_to_untracked = false,
                -- current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                -- current_line_blame_opts = {
                --    virt_text = true,
                --    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                --    delay = 1000,
                --    ignore_whitespace = false,
                --    virt_text_priority = 100,
                -- },
                current_line_blame_formatter = "<summary> - <author>, <author_time:%Y-%m-%d>",
                -- sign_priority = 6,
                -- update_debounce = 100,
                -- status_formatter = nil, -- Use default
                -- max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = "rounded",
                    style = "minimal",
                    relative = "cursor",
                    row = 1,
                    col = 1,
                },
                -- yadm = {
                --    enable = false
                -- },

                -- Move between hunks
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, lhs, rhs, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    -- Navigate hunks
                    map("n", "]h", function()
                        if vim.wo.diff then
                            return "]h"
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Next git hunk" })

                    map("n", "[h", function()
                        if vim.wo.diff then
                            return "[h"
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Previous git hunk" })
                end,
            })
        end,
    },
}
