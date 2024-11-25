return {
    {
        "andymass/vim-matchup",
        init = function()
            vim.g.matchup_matchparen_deferred = 1
            vim.g.matchup_matchparen_hi_surround_always = 0
            vim.g.matchup_matchparen_offscreen = {}
            vim.g.matchup_matchparen_stopline = 60
            vim.g.matchup_matchparen_timeout = 20
            vim.g.matchup_matchparen_insert_timeout = 20
            vim.g.matchup_matchparen_deferred_show_delay = 10
        end,
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },
}
