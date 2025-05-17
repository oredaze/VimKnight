return {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            vim.fn.matchadd("Statement", "[░▒]")
            vim.fn.matchadd("Identifier", "[▓█▄▀▐▌]")

            -- Set header
            dashboard.opts.layout[1].val = 1
            dashboard.section.header.val = {
                " ██▒   █▓    ██▓    ███▄ ▄███▓",
                "▓██░   █▒   ▓██▒   ▓██▒▀█▀ ██▒",
                " ▓██  █▒░   ▒██▒   ▓██    ▓██░",
                "  ▒██ █░░   ░██░   ▒██    ▒██ ",
                "   ▒▀█░     ░██░   ▒██▒   ░██▒",
                "   ░ ▐░     ░▓     ░ ▒░   ░  ░",
                "   ░ ░░      ▒ ░   ░  ░      ░",
                "     ░       ▒ ░   ░      ░   ",
                "      ░      ░            ░   ",
            }

            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button("n", " ) 󰻭 New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", " ) 󱋢 Recent files", ":Telescope oldfiles<CR>"),
                dashboard.button("f", " ) 󰱽 Find file", ":Telescope find_files<CR>"),
                dashboard.button("l", " )  Lf", ":Lf<CR>"),
                dashboard.button("b", " ) 󰆚 Broot", ":Broot<CR>"),
                dashboard.button("o", " ) 󱠆 Oil", ":Oil<CR>"),
                dashboard.button("g", " )  Grep project", ":Telescope live_grep<CR>"),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.width = 18
                button.opts.align_shortcut = "Left"
                button.opts.hl = "Statement"
                button.opts.hl_shortcut = "Number"
                button.opts.cursor = 1
            end

            require("alpha.themes.dashboard").section.footer.val = require("wisdom")()
            dashboard.section.footer.opts.hl = "Comment"

            -- Send config to alpha
            alpha.setup(dashboard.opts)

            -- Disable useless elements on alpha buffer
            vim.cmd([[
                autocmd User AlphaReady setlocal showtabline=0
                autocmd User AlphaReady setlocal laststatus=0
                autocmd User AlphaReady setlocal cmdheight=0
                autocmd User AlphaReady setlocal fillchars+=eob:\ 
                autocmd User AlphaClosed setlocal showtabline=2
                autocmd User AlphaClosed setlocal laststatus=3
                autocmd User AlphaClosed setlocal cmdheight=1
                autocmd User AlphaClosed setlocal fillchars+=eob:\~
            ]])
        end,
    },
}
