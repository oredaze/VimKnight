return {
    -- Tmux-like split guides
    {
        "nvim-zh/colorful-winsep.nvim",
        event = { "WinLeave" },
        config = function()
            vim.cmd([[
                :hi link ColorfulWinSep SpecialComment
                :hi! link WinSeparator Whitespace
            ]])
            require("colorful-winsep").setup({
                animate = { enabled = false },
                indicator_for_2wins = { position = false },
                colors = {},
            })
        end
    }
}
