return {
    "ATTron/bebop.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("bebop").setup({
            -- Use transparent background
            -- Set to false to use the colorscheme's background color
            transparent = false,

            -- Set terminal colors
            terminal_colors = false,

            -- Preset: "default", "spike", or "faye"
            preset = "faye",
        })
    end,
}
