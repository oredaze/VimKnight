return {
    {
        "nvim-zh/colorful-winsep.nvim",
        event = { "WinLeave" },
        config = function()
            require("colorful-winsep").setup({
                animate = { enabled = false },
                indicator_for_2wins = { position = false },
            })
        end
    }
}
