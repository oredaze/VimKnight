return {
    -- Quickly toggle commented lines
    {
        "numToStr/Comment.nvim",
        event = "CursorHold",
        opts = {
            padding = true,
            sticky = true,
            -- Lines to be ignored while comment/uncomment.
            -- Could be a regex string or a function that returns a regex string.
            -- Example: Use '^$' to ignore empty lines
            -- @type string|fun():string
            ignore = "^$",
            toggler = {
                line = "<C-c>c",
            },
            opleader = {
                line = "<C-c>",
                block = "<space>C",
            },
            extra = {
                above = '<C-c>O',
                below = '<C-c>o',
                eol = '<C-c>A',
            },
        },
    },
}
