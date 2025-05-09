return {
    -- Move a line or block
    {
        "fedepujol/move.nvim",
        event = "BufRead",
        config = function()
            require("move").setup({
                line = {
                    enable = true, -- Enables line movement
                    indent = false  -- Toggles indentation
                },
                block = {
                    enable = false, -- Enables block movement
                    indent = false  -- Toggles indentation
                },
                word = {
                    enable = false, -- Enables word movement
                },
                char = {
                    enable = false -- Enables char movement
                }
            })
        end,
    },
}
