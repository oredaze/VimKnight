return {
    -- Integrate external file managers into vim
    {
        "is0n/fm-nvim",
        cmd = { "Lf", "Broot", "Lazygit", "Ranger" },
        opts = {

            -- (Vim) Command used to open files
            edit_cmd = "edit",
            -- See `Q&A` for more info
            on_close = {},
            on_open = {},

            -- UI Options
            ui = {
                -- Default UI (can be "split" or "float")
                default = "float",
                float = {
                    -- Floating window border (see ':h nvim_open_win')
                    -- border = "rounded",
                    border = { "+", "-" ,"+", "|", "+", "-", "+", "|" },
                    -- border = { "┌", "─" ,"┐", "│", "┘", "─", "└", "│" },
                    -- border = { "┏", "━" ,"┓", "┃", "┛", "━", "┗", "┃" },
                    -- border = { "🭇", "▁", "🬼", "▏", "🭗", "▔", "🭢", "▕" },
                    -- Highlight group for floating window/border (see ':h winhl')
                    float_hl = "Normal",
                    border_hl = "TelescopeBorder",
                    -- Floating Window Transparency (see ':h winblend')
                    blend = 0,
                    -- Num from 0 - 1 for measurements
                    height = 0.8,
                    width = 0.8,
                    -- X and Y Axis of Window
                    x = 0.5,
                    y = 0.5,
                },
            },

            -- Terminal commands used w/ file manager (have to be in your $PATH)
            cmds = {
                lf_cmd = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
                broot_cmd = "broot",
                ranger_cmd = "ranger",
                lazygit_cmd = "lazygit",
            },

            -- Mappings used with the plugin
            mappings = {
                vert_split = "<C-v>",
                horz_split = "<C-s>",
                tabedit = "<C-t>",
                edit = "<C-e>",
                ESC = "q",
            },

            -- Path to broot config
            broot_conf = "~/.config/broot/vim_conf.hjson",
        },
    },
}
