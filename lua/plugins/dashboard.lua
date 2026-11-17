return {
    -- Startup screen
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "dashboard",
                callback = function()
                    vim.fn.matchadd('Include', '[▀▄▐█]')
                    vim.fn.matchadd('Statement', '[▓]')
                    vim.fn.matchadd('Error', '[▒░]')
                    vim.opt_local.fillchars:append('eob: ')
                end,
            })
            require('dashboard').setup({
                theme = 'hyper',
                config = {
                    header = {
                        "",
                        "  ██▒   █▓    ██▓    ███▄ ▄███▓ ",
                        " ▓██░   █▒   ▓██▒   ▓██▒▀█▀ ██▒ ",
                        "  ▓██  █▒░   ▒██▒   ▓██    ▓██░ ",
                        "   ▒██ █░░   ░██░   ▒██    ▒██  ",
                        "    ▒▀█░     ░██░   ▒██▒   ░██▒ ",
                        "    ░ ▐░     ░▓     ░ ▒░   ░  ░ ",
                        "    ░ ░░      ▒ ░   ░  ░      ░ ",
                        "      ░       ▒ ░   ░      ░    ",
                        "       ░      ░            ░    ",
                        "",
                        "",
                    },
                    project = { enable = false },
                    mru = { enable = true, limit = 15, icon = '  ', label = 'Recent files:', cwd_only = false },
                    week_header = { enable = false },
                    shortcut = {
                        {
                            desc = ' Dir',
                            group = 'Include',
                            action = 'FzfLua zoxide',
                            key = 'd'
                        },
                        {
                            desc = ' Tree',
                            group = 'Function',
                            action = 'Neotree float',
                            key = 'e',
                        },
                        {
                            desc = '󱩀 Find',
                            group = 'Constant',
                            action = 'FzfLua files',
                            key = 'f',
                        },
                        {
                            desc = ' Grep',
                            group = 'Statement',
                            action = 'FzfLua live_grep',
                            key = 'g',
                        },
                        {
                            desc = '󰌁 Oil',
                            group = 'Special',
                            action = 'Oil',
                            key = 'o',
                        },
                    },
                    footer = {},
                },
            })
        end,
    }
}
