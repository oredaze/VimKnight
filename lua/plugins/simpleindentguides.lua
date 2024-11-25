return {
    -- Shows the level of indent that uses spaces
    {
        "lucastavaresa/simpleIndentGuides.nvim",
        config = function()
            require("simpleIndentGuides").setup("┆", " ") -- gui:┊┆╎ tty:
        end,
    },
}
