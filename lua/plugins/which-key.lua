return {
    -- Hotkeys helper popup
    {
        "folke/which-key.nvim",
        cmd = "WhichKey",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>", group = "Plugins" },
                { "<leader>L", group = "LSP" },
                { "<leader>o", group = "Options" },
                { "<C-w>1", "1gt", hidden = true },
                { "<C-w>2", "2gt", hidden = true },
                { "<C-w>3", "3gt", hidden = true },
                { "<C-w>4", "4gt", hidden = true },
                { "<C-w>5", "5gt", hidden = true },
                { "<C-w>6", "6gt", hidden = true },
                { "<C-w>7", "7gt", hidden = true },
                { "<C-w>8", "8gt", hidden = true },
                { "<C-w>9", "9gt", hidden = true },
            })
            local setup = {
                delay = function(ctx)
                    return ctx.plugin and 0 or 1000 -- WhichKey popup delay
                end,
                icons = {
                    breadcrumb = ">", -- symbol used in the command line area that shows your active key combo
                    separator = "→", -- symbol used between a key and it's label
                    group = "+ ", -- symbol prepended to a group
                    mappings = false, -- devicons
                },
                show_help = false, -- show a help message in the command line for using WhichKey
                preset = "helix",
                win = {
                    border = { "+", "-" ,"+", "|", "+", "-", "+", "|" },
                    no_overlap = false,
                    width = { min = 30, max = 40 },
                },
                keys = {
                    scroll_down = "<c-d>",
                    scroll_up = "<c-u>",
                },
                triggers = {
                    { "<auto>", mode = "niotc" },
                },
            }
            wk.setup(setup)
        end,
    },
}
