return {
    -- Status & tab line with full control
    {
        "rebelot/heirline.nvim",
        event = "UiEnter",
        config = function()
            require("plugins.heirline.main")
        end,
    },
}
