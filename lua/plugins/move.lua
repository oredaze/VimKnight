return {
    -- Move a line or block
    {
        "fedepujol/move.nvim",
        event = "BufRead",
        config = function()
            require("move").setup({})
        end,
    },
}
