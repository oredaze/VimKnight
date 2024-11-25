return {
    -- Highlight matching words
    {
        "RRethy/vim-illuminate",
        event = "CursorMoved",
        config = function()
            require("illuminate").configure({
                providers = {
                    "lsp",
                    -- 'treesitter', -- very slow
                    "regex",
                },
                delay = 150,
                filetypes_denylist = {
                    "lazy",
                    "neo-tree",
                    "qf",
                    "Trouble",
                    "Outline",
                    "norg",
                },
                modes_allowlist = { "n" },
                min_count_to_highlight = 2,
            })
        end,
    },
}
