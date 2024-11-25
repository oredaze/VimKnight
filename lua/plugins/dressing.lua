return {
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {
            input = {
                -- Can be 'left', 'right', or 'center'
                title_pos = "center",
                border = "rounded",
            },
            select = {
                -- Priority list of preferred vim.select implementations
                backend = { "builtin", "nui", "telescope" },
            },
        },
    },
}
