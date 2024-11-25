return {
    -- C port of fzf for use in telescope
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = true,
        build = "make",
    },
}
