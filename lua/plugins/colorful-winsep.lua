return {
    {
        "nvim-zh/colorful-winsep.nvim",
        config = true,
        event = { "WinLeave" },
        config = function()
            require("colorful-winsep").setup({
                hi = {
                    link = "StatusLine",
                },
                only_line_seq = false,
            })
        end
    }
}
