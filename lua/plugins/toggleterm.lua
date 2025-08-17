return {
    {
        "akinsho/toggleterm.nvim",
        -- cmd = { "Toggleterm" },
        version = "*",
	opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            autochdir = true,
            -- shading_factor = '<number>', -- the percentage by which to lighten dark terminal background, default: -30
            -- shading_ratio = '<number>', -- the ratio of shading factor for light/dark terminal background, default: -3
            direction = 'horizontal',
        },
    },
}
