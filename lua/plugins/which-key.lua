return {
    -- Hotkeys helper popup
    {
        "folke/which-key.nvim",
        cmd = "WhichKey",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.add({
                { "t", group = "Trails" },
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
                    return ctx.plugin and 0 or 0 -- WhichKey popup delay
                end,
                icons = {
                    breadcrumb = ">", -- symbol used in the command line area that shows your active key combo
                    separator = "→", -- symbol used between a key and it's label
                    group = "+ ", -- symbol prepended to a group
                    mappings = false, -- devicons
                    keys = {
                        BS = "◀",
                        Tab = "⇥",
                        Space = "˽",
                        Esc = "✘",
                        CR = "↵",
                        C = "^",
                        S = "⇑",
                    },
                },
                win = {
                    no_overlap = false,
                    border = { "-", "-", "-", "", "", "", "", "" },
                    -- border = { "─", "─", "─", "", "", "", "", "" },
                    height = { min = 4, max = 16 }, -- min and max height of the columns
                    row = math.huge,
                },
                layout = {
                    width = { min = 20, max = 50 }, -- min and max width of the columns
                    spacing = 1, -- spacing between columns
                },
                keys = {
                    scroll_down = "<c-d>",
                    scroll_up = "<c-u>",
                },
                triggers = {
                    { "<auto>", mode = "niotc" },
                    { "t", mode = "n" },
                },
            }
            wk.setup(setup)
        end,
    },
}
