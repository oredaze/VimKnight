return {
    -- Helix-like cmdline
    {
        'vzze/cmdline.nvim',
        config = function()
            require('cmdline').setup({
                hl = {
                    default   = "Normal",
                    selection = "IncSearch",
                    directory = "Directory",
                    substr    = "Define"
                },
            })
        end
    },
}
