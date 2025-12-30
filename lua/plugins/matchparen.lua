return {
    -- Better than the builtin
    {
        "monkoose/matchparen.nvim",
        config = function()
            require("matchparen").setup()
        end,
    },
}
