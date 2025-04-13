return {
    {
        'echasnovski/mini.files',
        version = false,
        event = "VeryLazy",
        config = function()
            require('mini.files').setup {
                mappings = {
                    close = '<ESC>',
                    go_in_plus = 'l',
                    go_out_plus = '<BS>',
                    reset = 'w',
                    show_help = '?',
                },
                options = {
                    use_as_default_explorer = false,
                },
                windows = {
                    width_focus = 30,
                },
            }
        end,
    },
}
