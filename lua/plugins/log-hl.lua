return {
    -- Syntax highlighting for log files
    {
        "fei6409/log-highlight.nvim",
        ft = "log",
        config = function()
            require("log-highlight").setup({})
        end,
    },
}
