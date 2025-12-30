return {
    -- Automatic indentation settings based on file content
    {
        "nmac427/guess-indent.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            filetype_exclude = {
                "lazy",
                "qf",
                "Outline",
                "Oil",
            },
            buftype_exclude = {
                "help",
                "nofile",
                "terminal",
                "prompt",
            },
        },
    },
}
