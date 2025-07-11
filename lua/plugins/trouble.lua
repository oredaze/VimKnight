return {
    -- Better diagnostics list and others
    {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        opts = {
            focus = true, -- Focus the window when opened
            keys = {
                l = "fold_open",
                h = "fold_close",
                ["Right"] = "fold_open",
                ["Left"] = "fold_close",
                ["<cr>"] = "jump_close",
                p = "toggle_preview",
                v = "preview",
                f = "jump",
            },
            -- stylua: ignore
            icons = {
                indent = {
                    top         = "│",
                    middle      = "├",
                    last        = "└",
                    fold_open   = "-",
                    fold_closed = "+",
                },
                folder_closed   = "",
                folder_open     = "",
            },
        },
    },
}
